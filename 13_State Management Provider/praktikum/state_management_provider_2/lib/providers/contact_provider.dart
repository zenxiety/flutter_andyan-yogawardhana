import 'package:flutter/material.dart';
import 'package:state_management_provider_2/models/contact_model.dart';

class ContactProvider with ChangeNotifier {
  final List<Contact> contacts = [
    Contact(name: "Name One", number: "01238129"),
  ];

  int editIndex = -1;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  FocusNode numberFocusNode = FocusNode();

  String? validateName(String? value) {
    String invalidName = "";
    // if (value == "") return null;

    if (!value!.trim().contains(" ")) {
      invalidName += "Name must consist of at least 2 words.\n";
    }

    if (!RegExp(r"^[A-Za-z\s]*$").hasMatch(value)) {
      invalidName += "Name cannot contain numbers or special characters.\n";
    }

    if (!RegExp(r"^([A-Z][A-Za-z]*[ ]?)*$").hasMatch(value)) {
      invalidName += "Each word must begin with an uppercase letter.\n";
    }

    return invalidName != "" ? invalidName : null;
  }

  String? validateNumber(String? value) {
    String invalidNumber = "";
    // if (value == "") return null;

    if (value!.length < 8 || value.length > 15) {
      invalidNumber += "Phone number must consist of at least 8 digits.\n";
    }

    if (!RegExp(r"^[0][0-9]*$").hasMatch(value)) {
      invalidNumber += "Phone number must start with \"0\".\n";
    }

    return (invalidNumber != "") ? invalidNumber : null;
  }

  void submitForm({required BuildContext context}) {
    if (!formKey.currentState!.validate()) {
      snackBarPopup(
        message: "Please enter the valid contact information.",
        context: context,
      );
      return;
    }

    final Contact contact = Contact(
      name: nameController.text,
      number: numberController.text,
    );

    if (editIndex == -1) {
      addContact(contact);
      snackBarPopup(
        message: "Contact added successfully.",
        context: context,
      );
    } else {
      editContact(
        index: editIndex,
        contact: contact,
      );
      snackBarPopup(
        message: "Contact edited successfully.",
        context: context,
      );
    }

    nameController.clear();
    numberController.clear();

    notifyListeners();
  }

  void addContact(Contact contact) {
    contacts.add(contact);
    notifyListeners();
  }

  void deleteContact({required BuildContext context, required int index}) {
    contacts.removeAt(index);
    snackBarPopup(
      message: "Contact deleted successfully.",
      context: context,
    );
    notifyListeners();
  }

  void editContact({int index = -1, Contact? contact}) {
    if (contact == null) {
      // edit button on each contact
      editIndex = index;
    } else {
      // "update" button on edit state
      contacts[editIndex] = contact;
      editIndex = -1;
    }
    notifyListeners();
  }

  void cancelEditContact() {
    editIndex = -1;
    nameController.clear();
    numberController.clear();
    notifyListeners();
  }

  void snackBarPopup({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(label: "OK", onPressed: () {}),
      ),
    );
  }
}
