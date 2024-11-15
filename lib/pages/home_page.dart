import 'package:flutter/material.dart';
import 'package:yapper_bot/pages/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background1.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Container(
              height: 60,
              color: Colors.red,
            ),
            Expanded(child: ListView()),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.attachment,
                      color: Colors.white,
                      size: 32,
                    ),
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.transparent),
                        side: WidgetStatePropertyAll(
                            BorderSide(color: Colors.white))),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: TextField(
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
                          hintStyle: const TextStyle(fontFamily: 'Classica'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.blue)),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  IconButton(
                    onPressed: () {},
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
      ),
    );
  }
}
