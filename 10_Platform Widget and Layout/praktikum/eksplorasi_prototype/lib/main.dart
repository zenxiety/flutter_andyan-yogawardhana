import 'package:eksplorasi_prototype/material_eksplorasi_layout.dart';
import 'package:eksplorasi_prototype/screens/material_info.dart';
import 'package:eksplorasi_prototype/screens/material_learn_list.dart';
import 'package:eksplorasi_prototype/screens/material_search.dart';
import 'package:flutter/material.dart';

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
          backgroundColor: Color(0xFF6200EE),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF03DAC5),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF6200EE),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF03DAC5),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (_) => const MyMaterialEksplorasiLayout(),
        "/learn": (_) => const MyMaterialLearnList(),
        "/search": (_) => const MyMaterialSearch(),
        "/info": (_) => const MyMaterialInfo(),
      },
    );
  }
}
