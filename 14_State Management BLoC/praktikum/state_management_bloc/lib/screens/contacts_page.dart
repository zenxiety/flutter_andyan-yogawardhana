import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_management_bloc/blocs/contact/contact_bloc.dart';
import 'package:state_management_bloc/blocs/contact/contact_event.dart';
import 'package:state_management_bloc/blocs/contact/contact_state.dart';
import 'package:state_management_bloc/components/appbar.dart';
import 'package:state_management_bloc/components/drawer.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        return Scaffold(
          appBar: BaseAppBar(title: "Contacts", appBar: AppBar()),
          drawer: const BaseDrawer(),
          body: ListView(
            children: <Widget>[
              contactHero(context),
              contactForm(context, state),
              contactsList(context, state),
            ],
          ),
        );
      },
    );
  }

  Container contactHero(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 56, 16, 0),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        children: <Widget>[
          const Icon(
            Icons.phone_android,
            color: Color(0xFF49454F),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Create New Contacts",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Text(
            "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xFF49454F),
              height: 1.4,
            ),
            textAlign: TextAlign.justify,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(
              color: Color(0xFFCAC4D0),
            ),
          ),
        ],
      ),
    );
  }

  Padding contactForm(BuildContext context, ContactState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: context.read<ContactBloc>().formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                return context.read<ContactBloc>().validateName(value);
              },
              focusNode: context.read<ContactBloc>().nameFocusNode,
              controller: context.read<ContactBloc>().nameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: "Insert Your Name",
                labelText: "Name",
                labelStyle: TextStyle(fontFamily: "Bebas Neue"),
              ),
              style: GoogleFonts.poppins(),
            ),
            const SizedBox(height: 16),
            TextFormField(
              validator: (value) {
                return context.read<ContactBloc>().validateNumber(value);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              focusNode: context.read<ContactBloc>().numberFocusNode,
              controller: context.read<ContactBloc>().numberController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              maxLength: 15,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                counterText: '',
                prefixText: "+62 ",
                hintText: "...",
                labelText: "Number",
                labelStyle: TextStyle(fontFamily: "Bebas Neue"),
              ),
              style: GoogleFonts.poppins(),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 16, 8, 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  state.index != -1
                      //! cancel edit button
                      ? OutlinedButton(
                          onPressed: () {
                            context.read<ContactBloc>().add(
                                  CancelEditContact(),
                                );
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(fontSize: 14),
                          ),
                        )
                      : const Spacer(),
                  //! update/submit button
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<ContactBloc>()
                          .handleSubmit(context: context);
                    },
                    child: Text(
                      state.index != -1 ? "Update" : "Submit",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column contactsList(
    BuildContext context,
    ContactState state,
  ) {
    return Column(
      children: <Widget>[
        const Text(
          "List Contacts",
          style: TextStyle(fontSize: 24),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 60),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFBFE),
            borderRadius: BorderRadius.circular(28),
          ),
          child: state.contacts.isEmpty
              ? const Center(
                  child: Text(
                    "No Contacts Yet",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(parent: null),
                  itemCount: state.contacts.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          icon: Container(
                            padding: const EdgeInsets.all(16),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              state.contacts[index].name[0],
                              style: const TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w600,
                                color: Colors.lightBlue,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 4,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          title: Text(
                            state.contacts[index].name,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontSize: 20),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "+62${state.contacts[index].number}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            IconButton(
                              onPressed: () =>
                                  Navigator.pop(context, "Message"),
                              icon: const Icon(Icons.message),
                              color: Colors.lightBlue,
                            ),
                            IconButton(
                              onPressed: () =>
                                  Navigator.pop(context, "Voice Call"),
                              icon: const Icon(Icons.phone),
                              color: Colors.green,
                            ),
                            IconButton(
                              onPressed: () =>
                                  Navigator.pop(context, "Video Call"),
                              icon: const Icon(Icons.videocam_rounded),
                              color: Colors.orange,
                            )
                          ],
                          actionsAlignment: MainAxisAlignment.center,
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Text(
                                state.contacts[index].name[0],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.lightBlue,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    state.contacts[index].name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: const Color(0xFF1C1B1F),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "+62${state.contacts[index].number}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF49454F),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                //! edit contact button
                                IconButton(
                                  onPressed: () {
                                    context.read<ContactBloc>().add(
                                          EditContact(
                                            index: index,
                                            updatedContact: null,
                                          ),
                                        );
                                  },
                                  icon: const Icon(Icons.edit_outlined),
                                ),
                                //! delete contact button
                                IconButton(
                                  onPressed: () {
                                    context.read<ContactBloc>().add(
                                          DeleteContact(
                                            index: index,
                                            context: context,
                                          ),
                                        );
                                  },
                                  icon: const Icon(Icons.delete_outlined),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
