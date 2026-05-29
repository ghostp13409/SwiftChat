import 'package:equatable/equatable.dart';

enum MessageStatus { pending, sent, delivered, error }

class Message extends Equatable {
  const Message({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
    this.status = MessageStatus.sent,
    this.relayCount = 0,
  });

  final String id;
  final String senderId;
  final String content;
  final DateTime timestamp;
  final MessageStatus status;
  final int relayCount;

  @override
  List<Object?> get props => [id, senderId, content, timestamp, status, relayCount];

  Message copyWith({
    String? id,
    String? senderId,
    String? content,
    DateTime? timestamp,
    MessageStatus? status,
    int? relayCount,
  }) {
    return Message(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      relayCount: relayCount ?? this.relayCount,
    );
  }
}
