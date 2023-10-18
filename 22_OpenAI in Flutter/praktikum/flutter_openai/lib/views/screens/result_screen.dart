import 'package:flutter/material.dart';
import 'package:flutter_openai/models/openai_model.dart';

class ResultScreen extends StatelessWidget {
  final GptData? gptResponseData;

  const ResultScreen({super.key, required this.gptResponseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            const Text(
              "Recommendations",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              gptResponseData!.choices[0].text,
            ),
          ],
        ),
      ),
    );
  }
}
