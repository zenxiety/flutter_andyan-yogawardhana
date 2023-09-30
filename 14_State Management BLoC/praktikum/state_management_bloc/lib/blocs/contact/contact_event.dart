import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:state_management_bloc/models/contact_model.dart';

class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object?> get props => [];
}

class AddContact extends ContactEvent {
  final Contact contact;

  const AddContact({required this.contact});
}

class DeleteContact extends ContactEvent {
  final int index;
  final BuildContext context;

  const DeleteContact({required this.index, required this.context});
}

class EditContact extends ContactEvent {
  final int index;
  final Contact? updatedContact;

  const EditContact({required this.index, required this.updatedContact});
}

class CancelEditContact extends ContactEvent {}
