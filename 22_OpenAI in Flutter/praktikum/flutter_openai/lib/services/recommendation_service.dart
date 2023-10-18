import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_openai/constants/openai.dart';
import 'package:flutter_openai/models/openai_model.dart';
import 'package:http/http.dart' as http;

class RecommendationService {
  static Future<GptData> getRecommendations({
    required String budget,
    required String camera,
    required String storage,
  }) async {
    late GptData gptData = GptData(
      id: '',
      object: '',
      created: 0,
      model: '',
      choices: [],
      usage: Usage(promptTokens: 0, completionTokens: 0, totalTokens: 0),
    );

    try {
      var url = Uri.parse("https://api.openai.com/v1/completions");

      Map<String, String> headers = {
        "Content-Type": "application/json;charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "Bearer $apiKey",
      };

      String promptData =
          "Assume that you are a smartphone enthusiast and expert. Your friend is seeking smartphone recommendations based on specific requirements. Their budget is around $budget IDR. They are looking for a list of the best smartphones with a minimum camera resolution of $camera MP and a minimum storage capacity of $storage GB. Which smartphones would you recommend for them?";

      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "temperature": 0.4,
        "max_tokens": 64,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });

      var response = await http.post(url, headers: headers, body: data);

      debugPrint(response.body.toString());

      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      }
    } catch (e) {
      throw Exception("Error occured when sending request.");
    }

    return gptData;
  }
}
