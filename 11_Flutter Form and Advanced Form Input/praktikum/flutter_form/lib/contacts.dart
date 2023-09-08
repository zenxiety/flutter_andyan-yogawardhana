import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final GlobalKey formKey = GlobalKey<FormState>();
  final TextEditingController inputController = TextEditingController();

  final List<Widget> _contactsWidget = <Widget>[];
  final List<Map<String, String>> contacts = <Map<String, String>>[
    {'name': 'Name 1', 'number': '123456781'},
    {'name': 'Name 2', 'number': '123456782'},
    {'name': 'Name 3', 'number': '123456783'},
    {'name': 'Name 4', 'number': '123456784'},
  ];

  _ContactsState() {
    for (Map contact in contacts) {
      _contactsWidget.add(
        ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xFFEADDFF),
            foregroundColor: Colors.black,
            child: Text(
              contact['name'][0],
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          title: Text(contact['name'].toString()),
          subtitle: Text(
            "+62${contact['number'].toString()}",
            style: const TextStyle(fontSize: 14),
          ),
          trailing: IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: const Icon(Icons.edit_outlined),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        backgroundColor: const Color(0xFF6750A4),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(16, 56, 16, 0),
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: const Column(
              children: <Widget>[
                Icon(
                  Icons.phone_android,
                  color: Color(0xFF49454F),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Create New Contacts",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Text(
                  "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF49454F),
                    height: 1.4,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(
                    color: Color(0xFFCAC4D0),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  const TextField(
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "Insert Your Name",
                        labelText: "Name",
                        labelStyle: TextStyle(color: Color(0xFF49454F)),
                        fillColor: Color(0xFFE7E0EC),
                        filled: true,
                        floatingLabelStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder()),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        prefixText: "+62 ",
                        labelText: "Number",
                        labelStyle: TextStyle(color: Color(0xFF49454F)),
                        fillColor: Color(0xFFE7E0EC),
                        filled: true,
                        floatingLabelStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder()),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.fromLTRB(0, 16, 8, 48),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 24),
                        elevation: 0,
                        backgroundColor: const Color(0xFF6750A4),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              const Text(
                "List Contacts",
                style: TextStyle(fontSize: 24),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBFE),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: _contactsWidget,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
