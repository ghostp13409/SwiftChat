import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/error/failures.dart';
import '../../../discovery/data/data_sources/handshake_service.dart';
import '../../../discovery/domain/repositories/discovery_repository.dart';
import '../../../../core/utils/encryption_service.dart';
import '../../domain/entities/message.dart';
import '../../domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl({
    required this.discoveryRepository,
    required this.handshakeService,
    required this.encryptionService,
  }) {
    _init();
  }

  final DiscoveryRepository discoveryRepository;
  final HandshakeService handshakeService;
  final EncryptionService encryptionService;

  final _messageController = StreamController<Message>.broadcast();

  @override
  Stream<Message> get messageStream => _messageController.stream;

  void _init() {
    discoveryRepository.payloadStream.listen((payload) async {
      final String id = payload['senderId'];
      final Map<String, dynamic> data = payload['data'];

      if (data['type'] == 'chat_message') {
        final secret = handshakeService.getSecret(id);
        if (secret != null) {
          try {
            final decryptedContent = await encryptionService.decrypt(
              data['content'],
              secret,
            );
            final message = Message(
              id: const Uuid().v4(),
              senderId: id,
              content: decryptedContent,
              timestamp: DateTime.now(),
              status: MessageStatus.received,
            );
            _messageController.add(message);
          } catch (e) {
            // Handle decryption error
          }
        }
      }
    });
  }

  @override
  Future<Either<Failure, void>> sendMessage(
    String peerEndpointId,
    String content,
  ) async {
    final secret = handshakeService.getSecret(peerEndpointId);
    if (secret == null) {
      return const Left(
        P2PFailure('No secure link established with this peer'),
      );
    }

    try {
      final encryptedContent = await encryptionService.encrypt(content, secret);
      final payload = {'type': 'chat_message', 'content': encryptedContent};

      final result = await discoveryRepository.sendPayload(
        peerEndpointId,
        payload,
      );
      return result;
    } catch (e) {
      return Left(P2PFailure(e.toString()));
    }
  }
}
