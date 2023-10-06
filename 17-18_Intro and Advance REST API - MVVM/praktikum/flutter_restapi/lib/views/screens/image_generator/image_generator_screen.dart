import 'package:flutter/material.dart';
import 'package:flutter_restapi/views/widgets/drawer.dart';
import 'package:flutter_restapi/providers/image_generator_provider.dart';
import 'package:provider/provider.dart';

class ImageGeneratorScreen extends StatelessWidget {
  const ImageGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Generator"),
        centerTitle: true,
      ),
      drawer: const BaseDrawer(),
      body: Consumer<ImageGeneratorProvider>(
        builder: (context, state, _) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 160,
                  width: 160,
                  child: state.keyword == '' || state.keyword == null
                      ? Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            border: Border.all(
                              color: Colors.grey.shade500,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            "Enter a keyword",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : FutureBuilder(
                          future: state.fetchGeneratedImage(
                            state.keyword ?? '',
                          ),
                          builder: (_, snapshot) => state.buildAvatar(snapshot),
                        ),
                ),
                Form(
                  key: state.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: state.keywordController,
                        decoration: const InputDecoration(
                          labelText: "Name",
                          hintText: "Input text",
                        ),
                        validator: (value) => state.validateKeyword(value),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => state.onGenerateImage(),
                        child: const Text(
                          "GENERATE",
                          style: TextStyle(letterSpacing: 2),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
