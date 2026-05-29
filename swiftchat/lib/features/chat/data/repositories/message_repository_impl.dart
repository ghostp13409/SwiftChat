import 'package:dartz/dartz.dart';
import 'package:isar_community/isar.dart';
import '../../../../core/database/collections/message_collection.dart' as isar_msg;
import '../../../../core/error/failures.dart';
import '../../domain/entities/message.dart';
import '../../domain/repositories/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  MessageRepositoryImpl(this.isar);

  final Isar isar;

  @override
  Future<Either<Failure, void>> saveMessage(Message message, String chatPartnerId) async {
    try {
      await isar.writeTxn(() async {
        final collection = isar.messageCollections;
        
        // Check if message already exists
        final existing = await collection.filter().messageIdEqualTo(message.id).findFirst();
        
        final msgRecord = isar_msg.MessageCollection()
          ..messageId = message.id
          ..chatPartnerId = chatPartnerId
          ..senderId = message.senderId
          ..recipientId = chatPartnerId // Simplified for now
          ..content = message.content
          ..timestamp = message.timestamp
          ..ttl = DateTime.now().add(const Duration(hours: 24))
          ..status = _mapEntityStatusToIsar(message.status)
          ..isDirect = true;

        if (existing != null) {
          msgRecord.id = existing.id;
        }

        await collection.put(msgRecord);
      });
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Message>>> getMessages(String chatPartnerId) async {
    try {
      final messages = await isar.messageCollections
          .filter()
          .chatPartnerIdEqualTo(chatPartnerId)
          .sortByTimestamp()
          .findAll();

      return Right(
        messages.map((m) => Message(
          id: m.messageId,
          senderId: m.senderId,
          content: m.content,
          timestamp: m.timestamp,
          status: _mapIsarStatusToEntity(m.status),
        )).toList(),
      );
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markAsDelivered(String messageId) async {
    try {
      await isar.writeTxn(() async {
        final collection = isar.messageCollections;
        final existing = await collection.filter().messageIdEqualTo(messageId).findFirst();
        if (existing != null) {
          existing.status = isar_msg.MessageStatus.delivered;
          await collection.put(existing);
        }
      });
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  isar_msg.MessageStatus _mapEntityStatusToIsar(MessageStatus status) {
    switch (status) {
      case MessageStatus.pending:
        return isar_msg.MessageStatus.pending;
      case MessageStatus.sent:
        return isar_msg.MessageStatus.sent;
      case MessageStatus.delivered:
        return isar_msg.MessageStatus.delivered;
      case MessageStatus.error:
        return isar_msg.MessageStatus.pending; // Fallback
    }
  }

  MessageStatus _mapIsarStatusToEntity(isar_msg.MessageStatus status) {
    switch (status) {
      case isar_msg.MessageStatus.pending:
        return MessageStatus.pending;
      case isar_msg.MessageStatus.sent:
        return MessageStatus.sent;
      case isar_msg.MessageStatus.delivered:
        return MessageStatus.delivered;
    }
  }
}
