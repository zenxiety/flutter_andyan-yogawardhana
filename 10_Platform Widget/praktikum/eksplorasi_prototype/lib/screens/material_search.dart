import 'package:flutter/material.dart';

class MyMaterialSearch extends StatefulWidget {
  const MyMaterialSearch({super.key});

  @override
  State<MyMaterialSearch> createState() => _MyMaterialSearchState();
}

class _MyMaterialSearchState extends State<MyMaterialSearch> {
  final _formKey = GlobalKey<FormState>();
  final searchItemController = TextEditingController();

  @override
  void dispose() {
    searchItemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: _formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 240,
              child: TextFormField(
                validator: (value) {
                  return value == null || value.isEmpty ? "" : null;
                },
                controller: searchItemController,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(40, 40),
              ),
              onPressed: () {},
              child: const Icon(Icons.search),
            )
          ],
        ),
      ),
    );
  }
}
