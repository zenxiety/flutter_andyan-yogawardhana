import 'package:flutter/material.dart';
import 'material/material_app.dart';

import 'package:flutter/cupertino.dart';
import 'cupertino/cupertino_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyMaterialLayout();
  }
}
