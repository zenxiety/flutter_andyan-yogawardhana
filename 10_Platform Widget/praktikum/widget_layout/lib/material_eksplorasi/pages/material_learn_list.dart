import 'package:flutter/material.dart';

class MyMaterialLearnList extends StatefulWidget {
  const MyMaterialLearnList({super.key});

  @override
  State<MyMaterialLearnList> createState() => _MyMaterialLearnListState();
}

class _MyMaterialLearnListState extends State<MyMaterialLearnList> {
  final List<Widget> _widget = [];
  final List<String> _learn = [
    "Flutter",
    "ReactJS",
    "VueJS",
    "Tailwind CSS",
    "UI/UX",
    "Figma",
    "Digital Marketing"
  ];

  _MyMaterialLearnListState() {
    for (String el in _learn) {
      _widget.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Learn $el",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Divider(
              color: Colors.grey[300],
              height: 2,
              thickness: 2,
              indent: 16,
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _widget,
        ),
      ],
    );
  }
}
