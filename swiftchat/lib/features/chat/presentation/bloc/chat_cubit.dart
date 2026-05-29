import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/message.dart';
import '../../domain/repositories/chat_repository.dart';

abstract class ChatState extends Equatable {
  const ChatState();
  @override
  List<Object?> get props => [];
}

class ChatInitial extends ChatState {}

class ChatActive extends ChatState {
  const ChatActive({required this.messages});
  final List<Message> messages;

  @override
  List<Object?> get props => [messages];
}

class ChatError extends ChatState {
  const ChatError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.repository}) : super(ChatInitial());

  final ChatRepository repository;
  StreamSubscription? _messageSubscription;
  final List<Message> _messages = [];

  void init() {
    _messageSubscription = repository.messageStream.listen((message) {
      _messages.add(message);
      emit(ChatActive(messages: List.from(_messages)));
    });
  }

  Future<void> send(String peerId, String content) async {
    final myMessage = Message(
      id: DateTime.now().toIso8601String(),
      senderId: 'me',
      content: content,
      timestamp: DateTime.now(),
      status: MessageStatus.sent,
    );

    _messages.add(myMessage);
    emit(ChatActive(messages: List.from(_messages)));

    final result = await repository.sendMessage(peerId, content);
    result.fold((f) => emit(ChatError(f.message)), (_) => null);
  }

  @override
  Future<void> close() {
    _messageSubscription?.cancel();
    return super.close();
  }
}
