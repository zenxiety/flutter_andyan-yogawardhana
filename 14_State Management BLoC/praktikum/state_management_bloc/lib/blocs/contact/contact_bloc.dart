import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/blocs/contact/contact_event.dart';
import 'package:state_management_bloc/blocs/contact/contact_state.dart';
import 'package:state_management_bloc/models/contact_model.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  static const contact = Contact(
    name: "Name One",
    number: '012312301230',
  );

  static final List<Contact> initialContacts = [contact];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  FocusNode numberFocusNode = FocusNode();

  ContactBloc() : super(ContactsInitial(contacts: initialContacts)) {
    on<AddContact>((event, emit) {
      final updatedList = List<Contact>.from(state.contacts)
        ..add(event.contact);
      emit(ContactsUpdated(contacts: updatedList));
    });

    on<DeleteContact>((event, emit) {
      final updatedList = List<Contact>.from(state.contacts);
      updatedList.removeAt(event.index);
      emit(ContactsUpdated(contacts: updatedList));
    });

    on<EditContact>((event, emit) {
      if (event.updatedContact != null) {
        // edit "update" button
        final updatedList = List<Contact>.from(state.contacts);
        updatedList[event.index] = event.updatedContact!;
        emit(ContactsUpdated(contacts: updatedList));
      } else {
        // edit button on each contact
        nameController.text = state.contacts[event.index].name;
        numberController.text = state.contacts[event.index].number;
        emit(ContactsEdited(contacts: state.contacts, index: event.index));
      }
    });

    on<CancelEditContact>((event, emit) {
      nameController.clear();
      numberController.clear();
      emit(ContactsEdited(contacts: state.contacts, index: -1));
    });
  }

  String? validateName(String? value) {
    String invalidName = "";
    if (value == "" || value == null) {
      return "Please fill the contact name.";
    }

    if (!value.trim().contains(" ")) {
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
    if (value == "" || value == null) {
      return "Please fill the contact number.";
    }

    if (value.length < 8 || value.length > 15) {
      invalidNumber += "Phone number must consist of at least 8 digits.\n";
    }

    if (!RegExp(r"^[0][0-9]*$").hasMatch(value)) {
      invalidNumber += "Phone number must start with \"0\".\n";
    }

    return (invalidNumber != "") ? invalidNumber : null;
  }

  void handleSubmit({required BuildContext context}) {
    if (!formKey.currentState!.validate()) {
      snackBarPopup(
        context: context,
        message: "Please enter the valid contact information.",
      );
      return;
    }

    Contact newContact = Contact(
      name: nameController.text,
      number: numberController.text,
    );

    // if context is in editing state
    if (state.index != -1) {
      // edit existing contact
      context.read<ContactBloc>().add(
            EditContact(
              index: state.index,
              updatedContact: newContact,
            ),
          );
      snackBarPopup(
        context: context,
        message: "Contact successfully edited.",
      );
    } else {
      // add new contact
      context.read<ContactBloc>().add(AddContact(contact: newContact));

      snackBarPopup(
        context: context,
        message: "Contact successfully added.",
      );
    }

    nameController.clear();
    numberController.clear();
  }

  void snackBarPopup({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(label: "OK", onPressed: () {}),
      ),
    );
  }

  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.close();
  }
}
