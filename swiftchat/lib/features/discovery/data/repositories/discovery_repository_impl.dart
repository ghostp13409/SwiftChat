import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:nearby_connections/nearby_connections.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/peer.dart';
import '../../domain/repositories/discovery_repository.dart';

class DiscoveryRepositoryImpl implements DiscoveryRepository {
  final Strategy strategy = Strategy.P2P_CLUSTER;
  final Nearby nearby = Nearby();
  
  final _peersController = StreamController<List<Peer>>.broadcast();
  final _payloadController = StreamController<Map<String, dynamic>>.broadcast();
  
  final Map<String, Peer> _peers = {};

  @override
  Stream<List<Peer>> get discoveredPeers => _peersController.stream;

  @override
  Stream<Map<String, dynamic>> get payloadStream => _payloadController.stream;

  @override
  Future<Either<Failure, void>> startAdvertising(String userName) async {
    try {
      final bool running = await nearby.startAdvertising(
        userName,
        strategy,
        onConnectionInitiated: (id, info) => _onConnectionInitiated(id, info),
        onConnectionResult: (id, status) => _onConnectionResult(id, status),
        onDisconnected: (id) => _onDisconnected(id),
      );
      return running ? const Right(null) : const Left(P2PFailure('Failed to start advertising'));
    } catch (e) {
      return Left(P2PFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> stopAdvertising() async {
    await nearby.stopAdvertising();
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> startDiscovery() async {
    try {
      final bool running = await nearby.startDiscovery(
        "SwiftChat", // Service ID
        strategy,
        onEndpointFound: (id, name, serviceId) {
          if (_peers.containsKey(id)) {
            // Keep existing status if already connected/connecting
            _peers[id] = _peers[id]!.copyWith(userName: name);
          } else {
            _peers[id] = Peer(endpointId: id, endpointName: name, userName: name);
          }
          _updatePeers();
        },
        onEndpointLost: (id) {
          if (id != null && _peers[id]?.status != ConnectionStatus.connected) {
            _peers.remove(id);
            _updatePeers();
          }
        },
      );
      return running ? const Right(null) : const Left(P2PFailure('Failed to start discovery'));
    } catch (e) {
      return Left(P2PFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> stopDiscovery() async {
    await nearby.stopDiscovery();
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> requestConnection(String endpointId) async {
    try {
      final bool success = await nearby.requestConnection(
        "SwiftChatUser",
        endpointId,
        onConnectionInitiated: (id, info) => _onConnectionInitiated(id, info),
        onConnectionResult: (id, status) => _onConnectionResult(id, status),
        onDisconnected: (id) => _onDisconnected(id),
      );
      if (success) {
        _peers[endpointId] = _peers[endpointId]?.copyWith(status: ConnectionStatus.connecting) ?? 
            Peer(endpointId: endpointId, endpointName: "Unknown", status: ConnectionStatus.connecting);
        _updatePeers();
        return const Right(null);
      } else {
        return const Left(P2PFailure('Failed to request connection'));
      }
    } catch (e) {
      return Left(P2PFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> acceptConnection(String endpointId) async {
    try {
      await nearby.acceptConnection(
        endpointId,
        onPayLoadRecieved: (id, payload) => _onPayloadReceived(id, payload),
        onPayloadTransferUpdate: (id, update) => _onPayloadTransferUpdate(id, update),
      );
      return const Right(null);
    } catch (e) {
      return Left(P2PFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> rejectConnection(String endpointId) async {
    try {
      await nearby.rejectConnection(endpointId);
      _peers[endpointId] = _peers[endpointId]?.copyWith(status: ConnectionStatus.rejected) ??
          Peer(endpointId: endpointId, endpointName: "Unknown", status: ConnectionStatus.rejected);
      _updatePeers();
      return const Right(null);
    } catch (e) {
      return Left(P2PFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> disconnect(String endpointId) async {
    await nearby.disconnectFromEndpoint(endpointId);
    _onDisconnected(endpointId);
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> sendPayload(String endpointId, Map<String, dynamic> data) async {
    try {
      final String jsonStr = jsonEncode(data);
      await nearby.sendBytesPayload(endpointId, Uint8List.fromList(utf8.encode(jsonStr)));
      return const Right(null);
    } catch (e) {
      return Left(P2PFailure(e.toString()));
    }
  }

  // Callbacks
  void _onConnectionInitiated(String id, ConnectionInfo info) {
    _peers[id] = Peer(
      endpointId: id,
      endpointName: info.endpointName,
      status: ConnectionStatus.connecting,
      userName: info.endpointName,
    );
    _updatePeers();
    
    acceptConnection(id);
  }

  void _onConnectionResult(String id, Status status) {
    if (status == Status.CONNECTED) {
      _peers[id] = _peers[id]?.copyWith(status: ConnectionStatus.connected) ??
          Peer(endpointId: id, endpointName: "Unknown", status: ConnectionStatus.connected);
    } else if (status == Status.REJECTED || status == Status.ERROR) {
      _peers[id] = _peers[id]?.copyWith(status: ConnectionStatus.rejected) ??
          Peer(endpointId: id, endpointName: "Unknown", status: ConnectionStatus.rejected);
    }
    _updatePeers();
  }

  void _onDisconnected(String id) {
    _peers[id] = _peers[id]?.copyWith(status: ConnectionStatus.disconnected) ??
        Peer(endpointId: id, endpointName: "Unknown", status: ConnectionStatus.disconnected);
    _updatePeers();
  }

  void _onPayloadReceived(String id, Payload payload) {
    if (payload.type == PayloadType.BYTES) {
      final String str = utf8.decode(payload.bytes!);
      final Map<String, dynamic> data = jsonDecode(str);
      _payloadController.add({"senderId": id, "data": data});
    }
  }

  void _onPayloadTransferUpdate(String id, PayloadTransferUpdate update) {
    // Handle large file transfer updates here
  }

  void _updatePeers() {
    _peersController.add(_peers.values.toList());
  }
}
