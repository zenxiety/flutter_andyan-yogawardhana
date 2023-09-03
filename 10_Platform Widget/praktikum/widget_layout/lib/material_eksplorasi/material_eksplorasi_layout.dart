import 'package:flutter/material.dart';
import 'package:widget_layout/material_eksplorasi/pages/material_learn_list.dart';

class MyMaterialEksplorasiLayout extends StatelessWidget {
  const MyMaterialEksplorasiLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My Flutter App"),
          backgroundColor: const Color(0xFF6200EE),
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
        body: const SafeArea(child: MyMaterialLearnList()),
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          backgroundColor: Color(0xFF03DAC5),
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorites"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.error), label: "Information"),
          ],
          backgroundColor: const Color(0xFF6200EE),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
