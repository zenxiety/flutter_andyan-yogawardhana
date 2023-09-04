import 'package:flutter/material.dart';
import 'package:flutter_intro/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.lightBlue),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlueAccent,
            foregroundColor: Colors.white,
            disabledBackgroundColor: Colors.grey[900],
            disabledForegroundColor: const Color.fromARGB(150, 255, 100, 150),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
