import 'package:flutter/material.dart';
import 'package:flutter_restapi/views/widgets/drawer.dart';
import 'package:flutter_restapi/providers/fetch_image_provider.dart';
import 'package:provider/provider.dart';

class FetchImageScreen extends StatefulWidget {
  const FetchImageScreen({super.key});

  @override
  State<FetchImageScreen> createState() => _FetchImageScreenState();
}

class _FetchImageScreenState extends State<FetchImageScreen> {
  late final FetchImageProvider fetchImageProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchImageProvider = Provider.of<FetchImageProvider>(
        context,
        listen: false,
      );
      fetchImageProvider.resetSvg();
      await fetchImageProvider.fetchImage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch DiceBear Images"),
        centerTitle: true,
      ),
      drawer: const BaseDrawer(),
      body: Consumer<FetchImageProvider>(
        builder: (context, state, _) {
          return ListView.builder(
            itemCount: state.styles.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/fetchImageGallery',
                    arguments: {'style': state.styles[index], 'index': index},
                  );
                },
                child: ListTile(
                  title: Text(
                    state.styles[index][0].toUpperCase() +
                        state.styles[index].substring(1),
                  ),
                  // trailing: FutureBuilder(
                  //   future: state.fetchImage(index),
                  //   builder: (context, snapshot) {
                  //     return state.buildAvatar(snapshot);
                  //   },
                  // ),
                  // trailing: SizedBox(
                  //   height: 20,
                  //   width: 20,
                  //   // child: state.buildIcon(index: index),
                  // ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
