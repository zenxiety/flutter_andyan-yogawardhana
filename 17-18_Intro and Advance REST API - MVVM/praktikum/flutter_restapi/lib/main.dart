import 'package:flutter/material.dart';
import 'package:flutter_restapi/providers/fetch_image_provider.dart';
import 'package:flutter_restapi/providers/image_generator_provider.dart';
import 'package:flutter_restapi/providers/user_provider.dart';
import 'package:flutter_restapi/views/screens/fetch_image/fetch_image_screen.dart';
import 'package:flutter_restapi/views/screens/fetch_image/fetch_image_gallery_screen.dart';
import 'package:flutter_restapi/views/screens/image_generator/image_generator_screen.dart';
import 'package:flutter_restapi/views/screens/rest_api/json_convert_screen.dart';
import 'package:flutter_restapi/views/screens/rest_api/rest_create_screen.dart';
import 'package:flutter_restapi/views/screens/rest_api/rest_update_screen.dart';
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
        ChangeNotifierProvider(create: (context) => ImageGeneratorProvider()),
        ChangeNotifierProvider(create: (context) => FetchImageProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple.shade800,
            primary: Colors.deepPurple.shade800,
            secondary: Colors.deepPurple.shade800,
          ),
        ),
        initialRoute: '/restCreate',
        routes: {
          '/restCreate': (_) => const RestCreateScreen(),
          '/jsonConvert': (_) => const JsonConvertScreen(),
          '/restUpdate': (_) => const RestUpdateScreen(),
          '/fetchImage': (_) => const FetchImageScreen(),
          '/fetchImageGallery': (_) => const FetchImageGalleryScreen(),
          '/imageGenerator': (_) => const ImageGeneratorScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
