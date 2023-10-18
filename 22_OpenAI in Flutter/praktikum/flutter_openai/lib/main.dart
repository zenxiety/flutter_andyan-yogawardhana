import 'package:flutter/material.dart';
import 'package:flutter_openai/providers/recommendation_provider.dart';
import 'package:flutter_openai/views/screens/home_screen.dart';
import 'package:flutter_openai/views/screens/result_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RecommendationProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Flutter OpenAI Demo",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const HomeScreen(),
          '/result': (_) => const ResultScreen(gptResponseData: null),
        },
      ),
    );
  }
}
