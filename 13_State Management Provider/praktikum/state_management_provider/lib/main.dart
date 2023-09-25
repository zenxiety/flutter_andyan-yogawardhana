import 'package:asset_dialog_bottomsheet_navigation/screens/messages.dart';
import 'package:asset_dialog_bottomsheet_navigation/screens/new_message.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/contacts.dart';
import 'screens/gallery.dart';
import 'screens/image_details.dart';
import 'screens/picker.dart';
import 'package:flutter/material.dart';
import 'stores/contact.dart' as contact_store;
import 'stores/color.dart' as color_store;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => contact_store.Contact()),
        ChangeNotifierProvider(create: (_) => color_store.ColorState()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<color_store.ColorState>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Bebas Neue',
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: colorProvider.color,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
            textStyle: GoogleFonts.poppins(),
            foregroundColor: colorProvider.color,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: GoogleFonts.poppins(),
            backgroundColor: colorProvider.color,
          ),
        ),
      ),
      initialRoute: '/messages',
      routes: {
        '/gallery': (_) => const Gallery(),
        '/image_detail': (_) => const ImageDetails(),
        '/contacts': (_) => const ContactsPage(),
        '/picker': (_) => const PickerPage(),
        '/messages': (_) => const MessagesPage(),
        '/new_message': (_) => const NewMessage(),
      },
    );
  }
}
