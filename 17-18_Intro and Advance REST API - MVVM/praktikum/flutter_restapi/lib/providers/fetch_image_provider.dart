import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restapi/services/services.dart';
import 'package:flutter_restapi/utils/constants/image_styles.dart';
import 'package:flutter_restapi/utils/states/fetch_state.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FetchImageProvider with ChangeNotifier {
  final ApiService service = ApiService();
  FetchState fetchState = FetchState.initial;

  final List<String> styles = ImageStyles().styles;

  final List<String> svg = [];

  final Random random = Random();
  int imageCount = 0;

  Future<List<String>> fetchImage({index = -1}) async {
    final int randomImageCount = random.nextInt(20);
    imageCount = 1 + randomImageCount;
    notifyListeners();

    try {
      fetchState = FetchState.loading;
      notifyListeners();

      if (index == -1) {
        for (int i = 0; i < styles.length; i++) {
          final String result = await service.fetchImage(
            path:
                "https://api.dicebear.com/7.x/${styles[i]}/svg?seed=${i * 10}",
          );
          svg.add(result.toString());
          notifyListeners();
        }
      } else {
        for (int i = 0; i < imageCount; i++) {
          final String result = await service.fetchImage(
            path: "https://api.dicebear.com/7.x/${styles[index]}/svg?seed=$i",
          );
          svg.add(result.toString());
          notifyListeners();
        }
      }

      fetchState = FetchState.loaded;
      notifyListeners();
      return svg;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Widget buildIcon({required int index}) {
    if (fetchState == FetchState.loading) {
      return const CircularProgressIndicator();
    } else if (fetchState == FetchState.failed) {
      return const Text("FAILED");
    } else {
      return SvgPicture.string(svg[index]);
    }
  }

  void resetSvg() {
    svg.clear();
    notifyListeners();
  }
}
