import 'package:flutter/material.dart';
import 'package:flutter_storage/components/contact_form.dart';
import 'package:flutter_storage/screens/login_page.dart';
import 'package:flutter_storage/screens/picker_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late SharedPreferences logindata;
  String username = '';
  String email = '';

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username').toString();
      email = logindata.getString('email').toString();
    });
  }

  @override
  void initState() {
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            TextButton(
              child: const Text("Contacts"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ContactsPage()),
                );
              },
            ),
            TextButton(
              child: const Text("Picker"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const PickerPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          contactHero(context, username),
          const ContactForm(),
        ],
      ),
    );
  }

  Widget contactHero(BuildContext context, String username) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 56, 16, 0),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        children: <Widget>[
          const Icon(
            Icons.phone_android,
            color: Color(0xFF49454F),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Text(
                    username,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6750A4),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: ElevatedButton(
                    child: const Text("Logout"),
                    onPressed: () {
                      logindata.setBool('login', true);
                      logindata.remove('username');
                      logindata.remove('email');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Create New Contacts",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF49454F),
              height: 1.4,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),
          const Divider(
            color: Color(0xFFCAC4D0),
          ),
        ],
      ),
    );
  }
}
