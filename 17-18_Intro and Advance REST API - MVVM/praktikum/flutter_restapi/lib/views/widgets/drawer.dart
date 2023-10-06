import 'package:flutter/material.dart';

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/restCreate'),
              child: const Text("REST API Post"),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/jsonConvert'),
              child: const Text("JSON Convert"),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/restUpdate'),
              child: const Text("REST API Update"),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/fetchImage'),
              child: const Text("Image Fetch"),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/imageGenerator'),
              child: const Text("Image Generator"),
            ),
          ],
        ),
      ),
    );
  }
}
