import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message});
  final Message message;

  void _showMessageInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Message Info'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sent: ${DateFormat('MMM dd, yyyy HH:mm:ss').format(message.timestamp)}'),
            const SizedBox(height: 8),
            Text('Status: ${message.status.name.toUpperCase()}'),
            const SizedBox(height: 8),
            Text('Relay Count: ${message.relayCount}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMe = message.senderId == 'me';
    final theme = Theme.of(context);

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onLongPress: () => _showMessageInfo(context),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isMe ? Colors.deepPurple : Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message.content,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    DateFormat('HH:mm').format(message.timestamp),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: isMe ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  if (isMe) ...[
                    const SizedBox(width: 4),
                    _StatusIcon(status: message.status),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusIcon extends StatelessWidget {
  const _StatusIcon({required this.status});
  final MessageStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case MessageStatus.pending:
        return const Icon(Icons.access_time, size: 12, color: Colors.white70);
      case MessageStatus.sent:
        return const Icon(Icons.check, size: 12, color: Colors.white70);
      case MessageStatus.delivered:
        return const Icon(Icons.done_all, size: 12, color: Colors.white70);
      case MessageStatus.error:
        return const Icon(Icons.error_outline, size: 12, color: Colors.redAccent);
    }
  }
}
