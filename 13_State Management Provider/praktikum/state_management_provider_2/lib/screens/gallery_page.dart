import 'package:flutter/material.dart';
import 'package:state_management_provider_2/components/appbar.dart';
import 'package:state_management_provider_2/components/drawer.dart';
import 'package:state_management_provider_2/components/gallery_grid.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> assetImages = [
      'assets/images/img-1.jpg',
      'assets/images/img-2.jpg',
      'assets/images/img-3.jpg',
      'assets/images/img-4.jpg',
      'assets/gifs/gif-1.gif',
    ];

    final List<String> networkImages = [
      'https://picsum.photos/id/1/300',
      'https://picsum.photos/id/2/400/200',
      'https://picsum.photos/id/3/500/100',
      'https://picsum.photos/id/4/100/800',
      'https://picsum.photos/id/5/20/150',
      'https://picsum.photos/id/6/1000',
      'https://media.tenor.com/VLLJuwYmqkkAAAAC/error-wait.gif',
    ];

    return Scaffold(
      appBar: BaseAppBar(title: "Gallery", appBar: AppBar()),
      drawer: const BaseDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: [
            // ASSET IMAGE
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "ASSET IMAGES",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
            ),
            BaseGalleryGrid(images: assetImages),
            // NETWORK IMAGE
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "NETWORK IMAGES",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
            ),
            BaseGalleryGrid(images: networkImages),
          ],
        ),
      ),
    );
  }
}
