import 'package:flutter/material.dart';
import 'package:flutter_storage/helpers/database_helper.dart';
import 'package:flutter_storage/models/contact_model.dart';

class DbManager extends ChangeNotifier {
  List<ContactModel> _contactModels = [];
  late DatabaseHelper _dbHelper;

  List<ContactModel> get contactModels => _contactModels;

  DbManager() {
    _dbHelper = DatabaseHelper();
    _getAllContacts();
  }

  void _getAllContacts() async {
    _contactModels = await _dbHelper.getContacts();
    notifyListeners();
  }

  Future<void> addContact(ContactModel contactModel) async {
    await _dbHelper.insertContact(contactModel);
    _getAllContacts();
  }

  Future<ContactModel> getContactById(int id) async {
    return await _dbHelper.getContactById(id);
  }

  void updateContact(ContactModel contactModel) async {
    await _dbHelper.updateContact(contactModel);
    _getAllContacts();
  }

  void deleteContact(int id) async {
    await _dbHelper.deleteContact(id);
    _getAllContacts();
  }

  void deleteAllContact() async {
    await _dbHelper.clearAllContact();
    _getAllContacts();
  }
}
