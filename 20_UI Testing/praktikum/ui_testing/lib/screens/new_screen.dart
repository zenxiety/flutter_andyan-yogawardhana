import 'package:flutter/material.dart';
import 'package:ui_testing/screens/contacts_screen.dart';
import 'package:ui_testing/screens/picker_screen.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      Icons.wifi,
      Icons.battery_charging_full,
      Icons.android,
      Icons.four_g_mobiledata,
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("New Page Title")),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            TextButton(
              child: const Text("Contacts"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ContactsScreen()),
                );
              },
            ),
            TextButton(
              child: const Text("Picker"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const PickerScreen()),
                );
              },
            ),
            TextButton(
              child: const Text("New Screen"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const NewScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "The Four Cards",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xFF6750A4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Card ${index + 1}",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Icon(
                          icons[index],
                          color: Colors.white,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {},
                child: const Text("Learn More"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
