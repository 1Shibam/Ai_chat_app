import 'package:flutter/material.dart';
import 'package:yapper_bot/pages/app_colors.dart';
import 'package:yapper_bot/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade900,
        primaryColor: AppColors.shade3,
      ),
      home: const HomePage(),
    );
  }
}
