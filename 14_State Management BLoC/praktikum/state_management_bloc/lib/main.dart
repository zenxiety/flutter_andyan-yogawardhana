import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/blocs/contact/contact_bloc.dart';
import 'package:state_management_bloc/screens/contacts_page.dart';
import 'package:state_management_bloc/screens/gallery_page.dart';
import 'package:state_management_bloc/screens/image_details_page.dart';
import 'package:state_management_bloc/screens/picker_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
      create: (context) => ContactBloc(),
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
          '/image_details': (_) => const ImageDetailsPage(),
          '/contacts': (_) => const ContactsPage(),
          '/picker': (_) => const PickerPage(),
        },
      ),
    );
  }
}
