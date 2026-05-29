import 'dart:async';
import 'dart:developer' as developer;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../data/data_sources/handshake_service.dart';
import '../../../chat/data/services/sync_service.dart';
import '../../domain/entities/peer.dart';
import '../../domain/repositories/discovery_repository.dart';
import '../../domain/use_cases/discovery_use_cases.dart';

abstract class DiscoveryState extends Equatable {
  const DiscoveryState();
  @override
  List<Object?> get props => [];
}

class DiscoveryInitial extends DiscoveryState {}

class DiscoveryRunning extends DiscoveryState {
  const DiscoveryRunning({
    required this.peers,
    this.isAdvertising = false,
    this.isDiscovering = false,
  });
  final List<Peer> peers;
  final bool isAdvertising;
  final bool isDiscovering;

  @override
  List<Object?> get props => [peers, isAdvertising, isDiscovering];
}

class DiscoveryError extends DiscoveryState {
  const DiscoveryError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

class DiscoveryCubit extends Cubit<DiscoveryState> {
  DiscoveryCubit({
    required this.startAdvertising,
    required this.stopAdvertising,
    required this.startDiscovery,
    required this.stopDiscovery,
    required this.requestConnection,
    required this.repository,
    required this.handshakeService,
    required this.syncService,
  }) : super(DiscoveryInitial()) {
    init();
  }

  final StartAdvertising startAdvertising;
  final StopAdvertising stopAdvertising;
  final StartDiscovery startDiscovery;
  final StopDiscovery stopDiscovery;
  final RequestConnection requestConnection;
  final DiscoveryRepository repository;
  final HandshakeService handshakeService;
  final SyncService syncService;

  StreamSubscription? _peersSubscription;
  StreamSubscription? _payloadSubscription;
  bool _isAdvertising = false;
  bool _isDiscovering = false;
  List<Peer> _currentPeers = [];
  String? _myPeerId;

  void init() {
    _peersSubscription = repository.discoveredPeers.listen((peers) {
      final oldPeers = _currentPeers;
      _currentPeers = peers;

      // Detect new connections to initiate handshake
      if (_myPeerId != null) {
        for (final peer in peers) {
          final oldPeer = oldPeers
              .where((p) => p.endpointId == peer.endpointId)
              .firstOrNull;
          if (peer.status == ConnectionStatus.connected &&
              (oldPeer == null ||
                  oldPeer.status != ConnectionStatus.connected)) {
            handshakeService.initiateHandshake(peer.endpointId, _myPeerId!);
            syncService.sendHandshake(peer.endpointId);
          }
        }
      }

      _emitRunning();
    });

    _payloadSubscription = repository.payloadStream.listen((payload) {
      try {
        final String id = payload['senderId'];
        final Map<String, dynamic> data = payload['data'];

        if (data.containsKey('type')) {
          final type = data['type'].toString();
          if (type.startsWith('handshake_')) {
            handshakeService.handleHandshakePayload(id, data);
          } else if (type == 'sync_handshake') {
            syncService.handleHandshake(id, data);
          } else if (type == 'sync_request') {
            final hashes = List<String>.from(data['hashes'] as List);
            syncService.processSyncRequest(id, hashes);
          } else if (type == 'sync_data') {
            syncService.handleSyncData(data);
          }
        }
      } catch (e, stackTrace) {
        developer.log(
          'Error processing payload from ${payload['senderId']}',
          name: 'DiscoveryCubit',
          error: e,
          stackTrace: stackTrace,
        );
      }
    });
  }

  Future<void> startAll(String userName, String myPeerId) async {
    _myPeerId = myPeerId;
    final advResult = await startAdvertising(userName);
    final discResult = await startDiscovery(NoParams());
    // ... rest of method

    advResult.fold(
      (f) => emit(DiscoveryError(f.message)),
      (_) => _isAdvertising = true,
    );

    discResult.fold(
      (f) => emit(DiscoveryError(f.message)),
      (_) => _isDiscovering = true,
    );

    _emitRunning();
  }

  Future<void> stopAll() async {
    await stopAdvertising(NoParams());
    await stopDiscovery(NoParams());
    _isAdvertising = false;
    _isDiscovering = false;
    _emitRunning();
  }

  Future<void> connect(String endpointId) async {
    final result = await requestConnection(endpointId);
    result.fold((f) => emit(DiscoveryError(f.message)), (_) => null);
  }

  void _emitRunning() {
    emit(
      DiscoveryRunning(
        peers: _currentPeers,
        isAdvertising: _isAdvertising,
        isDiscovering: _isDiscovering,
      ),
    );
  }

  @override
  Future<void> close() {
    _peersSubscription?.cancel();
    _payloadSubscription?.cancel();
    return super.close();
  }
}
