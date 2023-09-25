import 'package:flutter/material.dart';

class ColorState with ChangeNotifier {
  Color _color = Colors.orange;

  Color get color => _color;

  void changeColor(Color newColor) {
    _color = newColor;
    notifyListeners();
  }
}
