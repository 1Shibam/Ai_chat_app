part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

//new message event

class ChatGenerationNewMessage extends ChatEvent {
  final String inputMessage;

  ChatGenerationNewMessage({required this.inputMessage});
}
