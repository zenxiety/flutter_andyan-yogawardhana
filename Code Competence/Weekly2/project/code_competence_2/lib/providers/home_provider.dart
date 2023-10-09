import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  void scrollTo({required BuildContext context, int index = 0}) {
    final screenHeight = MediaQuery.of(context).size.height;
    scrollController.animateTo(
      index * screenHeight,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }
}
