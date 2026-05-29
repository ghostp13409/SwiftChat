import 'package:equatable/equatable.dart';

enum MessageStatus { sending, sent, received, error }

class Message extends Equatable {
  const Message({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
    this.status = MessageStatus.sent,
  });

  final String id;
  final String senderId;
  final String content;
  final DateTime timestamp;
  final MessageStatus status;

  @override
  List<Object?> get props => [id, senderId, content, timestamp, status];
}
