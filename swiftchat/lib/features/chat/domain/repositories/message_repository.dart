import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/message.dart';

abstract class MessageRepository {
  Future<Either<Failure, void>> saveMessage(Message message, String chatPartnerId);
  Future<Either<Failure, List<Message>>> getMessages(String chatPartnerId);
  Future<Either<Failure, void>> markAsDelivered(String messageId);
}
