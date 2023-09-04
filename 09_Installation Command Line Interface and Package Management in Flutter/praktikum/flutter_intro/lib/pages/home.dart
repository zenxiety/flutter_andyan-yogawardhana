import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halo Alterra"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                textAlign: TextAlign.center,
                "Nama saya adalah Andyan Yogawardhana",
                style: TextStyle(fontSize: 32),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const ElevatedButton(
                  onPressed: null,
                  child: Icon(Icons.delete),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
