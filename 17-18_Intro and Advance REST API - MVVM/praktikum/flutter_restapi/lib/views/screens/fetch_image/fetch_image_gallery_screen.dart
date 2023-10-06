import 'package:flutter/material.dart';
import 'package:flutter_restapi/providers/fetch_image_provider.dart';
import 'package:provider/provider.dart';

class FetchImageGalleryScreen extends StatefulWidget {
  const FetchImageGalleryScreen({super.key});

  @override
  State<FetchImageGalleryScreen> createState() =>
      _FetchImageGalleryScreenState();
}

class _FetchImageGalleryScreenState extends State<FetchImageGalleryScreen> {
  late final FetchImageProvider fetchImageProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final Map args = ModalRoute.of(context)!.settings.arguments as Map;
      fetchImageProvider = Provider.of<FetchImageProvider>(
        context,
        listen: false,
      );
      fetchImageProvider.resetSvg();
      await fetchImageProvider.fetchImage(index: args['index']);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args['style'][0].toUpperCase() + args['style'].substring(1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer<FetchImageProvider>(
          builder: (context, state, _) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
              ),
              itemCount: state.imageCount,
              itemBuilder: (context, index) {
                if (index < state.imageCount) {
                  return Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Colors.deepPurple.shade900,
                        width: 2,
                      ),
                    ),
                    child: state.buildIcon(index: index),
                  );
                } else {
                  return const SizedBox();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
