import 'package:flutter/material.dart';
import 'package:flutter_form/contacts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6750A4),
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            backgroundColor: const Color(0xFF6750A4),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            foregroundColor: const Color(0xFF6750A4),
            side: const BorderSide(
              color: Color(0xFF6750A4),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          prefixStyle: TextStyle(color: Color(0xFF49454F)),
          labelStyle: TextStyle(color: Color(0xFF49454F)),
          fillColor: Color(0xFFE7E0EC),
          filled: true,
          focusedBorder: UnderlineInputBorder(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Contacts(),
    );
  }
}
