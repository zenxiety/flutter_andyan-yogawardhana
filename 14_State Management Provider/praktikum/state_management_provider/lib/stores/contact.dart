import 'package:flutter/material.dart';

class Contact with ChangeNotifier {
  final List<Map<String, String>> _contacts = [
    {
      'name': 'Name A',
      'number': '123456781',
      'date': 'Sunday, 01 January 2020',
      'color': 'Color(0xffffffff)',
      'file': "test_1.jpg",
    },
    {
      'name': 'Name B',
      'number': '123456782',
      'date': 'Monday, 02 February 2021',
      'color': 'Color(0xff000000)',
      'file': "test-2.png",
    },
  ];

  List<Map<String, String>> get contacts => _contacts;

  void add(Map<String, String> contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}
