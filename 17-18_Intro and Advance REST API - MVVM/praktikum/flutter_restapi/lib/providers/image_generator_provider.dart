import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restapi/services/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageGeneratorProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController keywordController = TextEditingController();

  String? keyword;

  final ApiService service = ApiService();

  String? validateKeyword(String? value) {
    return value == null || value.trim() == '' ? "Enter a keyword" : null;
  }

  void onGenerateImage() {
    if (formKey.currentState!.validate()) {
      keyword = keywordController.text;
      notifyListeners();
    }
  }

  Future<String> fetchGeneratedImage(String keyword) async {
    const String backgroundType = 'gradientLinear';
    const String fontFamily = 'Tahoma';
    const int fontWeight = 500;
    const int radius = 6;

    final String path =
        'https://api.dicebear.com/7.x/initials/svg?seed=$keyword&backgroundType=$backgroundType&fontFamily=$fontFamily&fontWeight=$fontWeight&radius=$radius';

    try {
      final String result = await service.fetchGeneratedImage(path);

      return result;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Widget buildAvatar(AsyncSnapshot<String> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Center(child: Text("Error loading avatar: ${snapshot.error}"));
    } else {
      return SvgPicture.string(snapshot.data!);
    }
  }
}
