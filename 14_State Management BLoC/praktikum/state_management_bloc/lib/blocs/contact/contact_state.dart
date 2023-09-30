import 'package:equatable/equatable.dart';
import 'package:state_management_bloc/models/contact_model.dart';

abstract class ContactState extends Equatable {
  final List<Contact> contacts;
  final int index;

  const ContactState({required this.contacts, required this.index});

  @override
  List<Object?> get props => [contacts, index];
}

class ContactsInitial extends ContactState {
  const ContactsInitial({required List<Contact> contacts})
      : super(contacts: contacts, index: -1);
}

class ContactsUpdated extends ContactState {
  const ContactsUpdated({required List<Contact> contacts})
      : super(contacts: contacts, index: -1);
}

class ContactsEdited extends ContactState {
  const ContactsEdited({required List<Contact> contacts, required int index})
      : super(contacts: contacts, index: index);
}
