import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Halo Alterra"),
          backgroundColor: Colors.blue[800],
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: Center(
            child: Text(
              "Nama saya adalah Andyan Yogawardhana",
              style: TextStyle(fontSize: 18, color: Colors.blue[800]),
            ),
          ),
        ),
      ),
    );
  }
}
