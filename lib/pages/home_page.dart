import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:yapper_bot/bloc/chat_bloc.dart';
import 'package:yapper_bot/models/chat_respnse_model.dart';
import 'package:yapper_bot/pages/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController userText = TextEditingController();
  final ChatBloc _chatBloc = ChatBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: _chatBloc,
        listener: (context, state) {
          // TODO: implement listener
        },

        // VIDEO TIME - 1:13:58,
        // listenWhen: ,
        // buildWhen: ,
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (ChatSuccessState):
              List<ChatRespnseModel> msg = (state as ChatSuccessState).messages;
              return Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.7,
                        image: AssetImage("assets/images/background1.jpg"),
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 28,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Yapper-Bot',
                        style: TextStyle(
                            fontFamily: 'Classica',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 28),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: msg.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: Column(
                            crossAxisAlignment: msg[index].role == "user"
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                msg[index].role == "user"
                                    ? "User"
                                    : "Yapper-Bot",
                                style: const TextStyle(
                                    fontFamily: 'Classica',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: msg[index].role == "user"
                                          ? const Color.fromARGB(126, 0, 63, 0)
                                              .withOpacity(0.7)
                                          : const Color.fromARGB(155, 0, 38, 63)
                                              .withOpacity(0.7),
                                      borderRadius: msg[index].role == "user"
                                          ? BorderRadius.circular(20).copyWith(
                                              topRight:
                                                  const Radius.circular(0))
                                          : BorderRadius.circular(20).copyWith(
                                              topLeft:
                                                  const Radius.circular(0)),
                                      border: Border.all(color: Colors.white)),
                                  child: Text(
                                    msg[index].parts.first.text,
                                    style: const TextStyle(
                                        fontFamily: 'Classica',
                                        color: Colors.white,
                                        fontSize: 18),
                                  )),
                            ],
                          ),
                        );
                      },
                    )),
                    if (_chatBloc.generationInProgress)
                      Row(
                        children: [
                          Container(
                              height: 100,
                              width: 100,
                              child:
                                  Lottie.asset('assets/animation/loader.json')),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Loading...',
                            style: const TextStyle(
                                fontFamily: 'Classica',
                                color: Colors.white,
                                fontSize: 18),
                          )
                        ],
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: userText,
                              maxLines: null,
                              minLines: 1,
                              keyboardType: TextInputType.multiline,
                              cursorColor: Colors.blue,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Classica',
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  hintText: 'What do yo want to ask?',
                                  hintStyle:
                                      const TextStyle(fontFamily: 'Classica'),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: Colors.blue)),
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          IconButton(
                            onPressed: () {
                              if (userText.text.isNotEmpty) {
                                String tempText = userText.text;
                                userText.clear();
                                _chatBloc.add(ChatGenerationNewMessage(
                                    inputMessage: tempText));
                              }
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 32,
                            ),
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.transparent),
                                side: WidgetStatePropertyAll(
                                    BorderSide(color: Colors.white))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );

            default:
              return const SizedBox(
                height: 10,
              );
          }
        },
      ),
    );
  }
}
