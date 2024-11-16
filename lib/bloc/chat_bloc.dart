import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yapper_bot/models/chat_respnse_model.dart';
import 'package:yapper_bot/repos/chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatSuccessState(messages: const [])) {
    on<ChatGenerationNewMessage>(_chatGenerationNewMessage);
    //empty list for the input user types
  }
  List<ChatRespnseModel> userMessages = [];
  bool generationInProgress = false;

  FutureOr<void> _chatGenerationNewMessage(
      ChatGenerationNewMessage event, Emitter<ChatState> emit) async {
    userMessages.add(ChatRespnseModel(
        role: "user", parts: [ChatModelPart(text: event.inputMessage)]));

    emit(ChatSuccessState(messages: userMessages));

    generationInProgress = true;
    String generateBotResponse =
        await ChatRepository.ChatTextGenerationRepository(userMessages);
    if (generateBotResponse.isNotEmpty) {
      userMessages.add(ChatRespnseModel(
          role: 'model', parts: [ChatModelPart(text: generateBotResponse)]));
      emit(ChatSuccessState(messages: userMessages));
    }
    generationInProgress = false;
  }
}
