import 'package:flutter/material.dart';

Widget buildDrawer(BuildContext context) {
  return Drawer(
    width: 240,
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListView(
        children: <Widget>[
          TextButton(
            child: const Text("Contacts"),
            onPressed: () {
              Navigator.of(context).pushNamed("/contacts");
            },
          ),
          TextButton(
            child: const Text("Picker"),
            onPressed: () {
              Navigator.of(context).pushNamed("/picker");
            },
          ),
          TextButton(
            child: const Text("Gallery"),
            onPressed: () {
              Navigator.of(context).pushNamed("/gallery");
            },
          ),
        ],
      ),
    ),
  );
}
