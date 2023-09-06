import 'package:flutter/material.dart';

class MyMaterialAddList extends StatefulWidget {
  const MyMaterialAddList({super.key});

  @override
  State<MyMaterialAddList> createState() => _MyMaterialAddListState();
}

class _MyMaterialAddListState extends State<MyMaterialAddList> {
  final _formKey = GlobalKey<FormState>();
  final addItemController = TextEditingController();

  @override
  void dispose() {
    addItemController
        .dispose(); // clean up controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add a Topic"),
          backgroundColor: const Color(0xFF6200EE),
          centerTitle: true,
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextFormField(
                  validator: (value) {
                    return value == null || value.isEmpty
                        ? "Please enter the name of the topic"
                        : null;
                  },
                  controller: addItemController,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, addItemController.text);
                  }
                },
                child: const Text("Add"),
              )
            ],
          ),
        ));
  }
}
