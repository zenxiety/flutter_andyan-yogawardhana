import 'package:eksplorasi_prototype/screens/material_add_list.dart';
import 'package:eksplorasi_prototype/screens/material_info.dart';
import 'package:eksplorasi_prototype/screens/material_learn_list.dart';
import 'package:eksplorasi_prototype/screens/material_search.dart';
import 'package:flutter/material.dart';

class MyMaterialEksplorasiLayout extends StatefulWidget {
  const MyMaterialEksplorasiLayout({super.key});

  @override
  State<MyMaterialEksplorasiLayout> createState() =>
      _MyMaterialEksplorasiLayoutState();
}

class _MyMaterialEksplorasiLayoutState
    extends State<MyMaterialEksplorasiLayout> {
  int _selectedIndex = 0;

  final List<Widget> _widgets = <Widget>[
    const MyMaterialLearnList(),
    const MyMaterialSearch(),
    const MyMaterialInfo(),
  ];

  void _onItemTapped(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Flutter App"),
        centerTitle: true,
        actions: const <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: _widgets[_selectedIndex],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add a Topic",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const MyMaterialAddList(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error),
            label: "Information",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
