import 'package:asset_dialog_bottomsheet_navigation/components/appbar.dart';
import 'package:asset_dialog_bottomsheet_navigation/components/drawer.dart';
import 'package:asset_dialog_bottomsheet_navigation/components/gallery_grid.dart';

import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> assetImages = [
      'assets/img-1.jpg',
      'assets/img-2.jpg',
      'assets/img-3.jpg',
      'assets/img-4.jpg',
      'assets/gif-1.gif',
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
      appBar: const BaseAppBar(
        title: "Gallery",
      ),
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
            GalleryGrid(images: assetImages),
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
            GalleryGrid(images: networkImages),
          ],
        ),
      ),
    );
  }
}
