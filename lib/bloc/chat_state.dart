part of 'chat_bloc.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

//chat response success state

class ChatSuccessState extends ChatState {
  final List<ChatRespnseModel> messages;

  ChatSuccessState({required this.messages});
}
