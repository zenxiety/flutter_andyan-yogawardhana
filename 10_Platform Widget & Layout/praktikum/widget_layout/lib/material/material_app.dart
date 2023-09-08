import 'package:flutter/material.dart';
import 'package:widget_layout/material/pages/material_home.dart';
import 'package:widget_layout/material/pages/material_list.dart';

class MyMaterialLayout extends StatelessWidget {
  const MyMaterialLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: const <Widget>[
              ListTile(
                title: Text("Home"),
              ),
              ListTile(
                title: Text("Settings"),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("MaterialApp"),
        ),
        body: const SafeArea(child: MyMaterialList()),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}
