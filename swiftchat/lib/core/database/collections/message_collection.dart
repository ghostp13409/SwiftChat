import 'package:isar/isar.dart';

part 'message_collection.g.dart';

enum MessageStatus { pending, sent, delivered }

@collection
class MessageCollection {
  Id id = Isar.autoIncrement;

  @Index()
  late String messageId; // Unique UUID

  @Index()
  late String chatPartnerId;

  late String senderId;
  late String recipientId;
  late String content;

  @Index()
  late DateTime timestamp;

  @enumerated
  late MessageStatus status;

  late bool isDirect;
}
