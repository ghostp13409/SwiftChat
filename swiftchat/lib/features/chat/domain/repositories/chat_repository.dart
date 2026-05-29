import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/message.dart';

abstract class ChatRepository {
  Future<Either<Failure, void>> sendMessage(
    String peerEndpointId,
    String content,
  );
  Stream<Message> get messageStream;
}
