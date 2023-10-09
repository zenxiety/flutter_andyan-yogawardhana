import 'package:code_competence_2/providers/contact_provider.dart';
import 'package:code_competence_2/providers/home_provider.dart';
import 'package:code_competence_2/screens/home_page.dart';
import 'package:flutter/material.dart';
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
        ChangeNotifierProvider(create: (_) => ContactProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              textStyle: GoogleFonts.bebasNeue(letterSpacing: 4),
              backgroundColor: Colors.black,
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const HomePage(),
        },
      ),
    );
  }
}
