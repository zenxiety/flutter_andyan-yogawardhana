import 'package:flutter/material.dart';
import 'package:state_management_provider_2/screens/contacts_page.dart';
import 'package:state_management_provider_2/screens/gallery_page.dart';
import 'package:state_management_provider_2/screens/image_details_page.dart';
import 'package:state_management_provider_2/screens/picker_page.dart';
import 'package:provider/provider.dart';

import 'package:state_management_provider_2/providers/contact_provider.dart';

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
      ],
      child: MaterialApp(
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
        initialRoute: '/contacts',
        routes: {
          '/gallery': (_) => const GalleryPage(),
          '/image_detail': (_) => const ImageDetailsPage(),
          '/contacts': (_) => const ContactsPage(),
          '/picker': (_) => const PickerPage(),
        },
      ),
    );
  }
}
