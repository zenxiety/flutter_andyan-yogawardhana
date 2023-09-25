import 'package:asset_dialog_bottomsheet_navigation/screens/contacts.dart';
import 'package:asset_dialog_bottomsheet_navigation/screens/gallery.dart';
import 'package:asset_dialog_bottomsheet_navigation/screens/image_details.dart';
import 'package:asset_dialog_bottomsheet_navigation/screens/picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Bebas Neue',
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
          ),
        ),
      ),
      initialRoute: '/gallery',
      routes: {
        '/gallery': (_) => const Gallery(),
        '/image_detail': (_) => const ImageDetails(),
        '/contacts': (_) => const ContactsPage(),
        '/picker': (_) => const PickerPage(),
      },
    );
  }
}
