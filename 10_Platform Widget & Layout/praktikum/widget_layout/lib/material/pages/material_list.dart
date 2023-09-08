import 'package:flutter/material.dart';

class MyMaterialList extends StatefulWidget {
  const MyMaterialList({super.key});

  @override
  State<MyMaterialList> createState() => _MyMaterialListState();
}

class _MyMaterialListState extends State<MyMaterialList> {
  final List<Widget> _list = [];
  final List<Map<String, String>> _data = [
    {"name": "Leanne Graham", "phone": "1-770 736-8031 x56442"},
    {"name": "Ervin Howell", "phone": "010-692-6593- x09125"},
    {"name": "Clementine Bauch", "phone": "1-463-123-4447"},
    {"name": "Patricia Lebsack", "phone": "493-170-9623 x156"},
    {"name": "Chelsey Dietrich", "phone": "(254)954-1289"},
    {"name": "Mrs. Dennis Schulist", "phone": "1-447-935-8478 x6430"},
    {"name": "Kurtis Weissnat", "phone": "210.067.6132"},
    {"name": "Leanne Graham", "phone": "1-770 736-8031 x56442"},
    {"name": "Ervin Howell", "phone": "010-692-6593- x09125"},
    {"name": "Clementine Bauch", "phone": "1-463-123-4447"},
    {"name": "Patricia Lebsack", "phone": "493-170-9623 x156"},
    {"name": "Chelsey Dietrich", "phone": "(254)954-1289"},
    {"name": "Mrs. Dennis Schulist", "phone": "1-447-935-8478 x6430"},
    {"name": "Kurtis Weissnat", "phone": "210.067.6132"},
  ];

  _MyMaterialListState() {
    for (Map<String, String> el in _data) {
      _list.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.green,
                child: Center(
                  child: Text(
                    el['name']![0],
                    style: TextStyle(color: Colors.grey[800], fontSize: 20),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      el['name'].toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      el['phone'].toString(),
                      style:
                          const TextStyle(fontSize: 14, color: Colors.white70),
                    )
                  ],
                ),
              ),
            ],
          ),
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
          children: _list,
        )
      ],
    );
  }
}
