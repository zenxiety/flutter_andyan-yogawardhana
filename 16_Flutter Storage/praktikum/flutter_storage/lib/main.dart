import 'package:flutter/material.dart';
import 'package:flutter_storage/models/db_manager.dart';
import 'package:flutter_storage/screens/contacts_page.dart';
import 'package:flutter_storage/screens/login_page.dart';
import 'package:flutter_storage/screens/picker_page.dart';
import 'package:google_fonts/google_fonts.dart';
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
        ChangeNotifierProvider(create: (context) => DbManager()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF6750A4),
            centerTitle: true,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF6750A4),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16),
              textStyle: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              backgroundColor: const Color(0xFF6750A4),
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              foregroundColor: const Color(0xFF6750A4),
              side: const BorderSide(
                color: Color(0xFF6750A4),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            prefixIconColor: Color(0xFF6750A4),
            prefixStyle: TextStyle(color: Color(0xFF49454F)),
            labelStyle: TextStyle(color: Color(0xFF49454F)),
            fillColor: Color(0xFFE7E0EC),
            filled: true,
            focusedBorder: UnderlineInputBorder(),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) => const LoginPage(),
          '/contacts': (_) => const ContactsPage(),
          '/picker': (_) => const PickerPage(),
        },
      ),
    );
  }
}
