import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_storage/models/contact_model.dart';
import 'package:flutter_storage/models/db_manager.dart';
import 'package:provider/provider.dart';

class ContactForm extends StatefulWidget {
  final ContactModel? contactModel;

  const ContactForm({super.key, this.contactModel});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  bool _isUpdate = false;
  int _selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    if (widget.contactModel != null) {
      _nameController.text = widget.contactModel!.name;
      _isUpdate = true;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    String invalidName = "";
                    // if (value == "") return null;

                    if (!value!.trim().contains(" ")) {
                      invalidName += "Name must consist of at least 2 words.\n";
                    }
                    if (!RegExp(r"^[A-Za-z\s]*$").hasMatch(value)) {
                      invalidName +=
                          "Name cannot contain numbers or special characters.\n";
                    }

                    if (!RegExp(r"^([A-Z][A-Za-z]*[ ]?)*$").hasMatch(value)) {
                      invalidName +=
                          "Each word must begin with an uppercase letter.\n";
                    }

                    return invalidName != "" ? invalidName : null;
                  },
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "Insert Your Name",
                    labelText: "Name",
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: (value) {
                    String invalidNumber = "";
                    // if (value == "") return null;

                    if (value!.length < 8 || value.length > 15) {
                      invalidNumber +=
                          "Phone number must consist of at least 8 digits.\n";
                    }

                    if (!RegExp(r"^[0][0-9]*$").hasMatch(value)) {
                      invalidNumber += "Phone number must start with \"0\".\n";
                    }

                    return (invalidNumber != "") ? invalidNumber : null;
                  },
                  controller: _numberController,
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
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 16, 8, 48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _isUpdate == true
                          ? OutlinedButton(
                              onPressed: () {
                                _isUpdate = false;
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(fontSize: 14),
                              ),
                            )
                          : const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (!_isUpdate) {
                              final contact = ContactModel(
                                name: _nameController.text,
                                number: _numberController.text,
                              );
                              Provider.of<DbManager>(context, listen: false)
                                  .addContact(contact);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Contact successfully added.",
                                  ),
                                ),
                              );
                              _nameController.clear();
                              _numberController.clear();
                            } else {
                              debugPrint(_selectedIndex.toString());
                              final contact = ContactModel(
                                id: _selectedIndex + 1,
                                name: _nameController.text,
                                number: _numberController.text,
                              );
                              debugPrint(contact.id.toString());
                              debugPrint(contact.name.toString());
                              debugPrint(contact.number.toString());
                              Provider.of<DbManager>(context, listen: false)
                                  .updateContact(contact);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Contact successfully updated.",
                                  ),
                                ),
                              );
                              _isUpdate = false;
                              _nameController.clear();
                              _numberController.clear();
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please enter the valid contact information.",
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const Text(
          "List Contacts",
          style: TextStyle(fontSize: 24),
        ),
        Consumer<DbManager>(
          builder: (context, manager, child) {
            final contactItems = manager.contactModels;
            return manager.contactModels.isEmpty
                ? const Center(
                    child: Text("No contacts available"),
                  )
                : Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFBFE),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(parent: null),
                      itemCount: contactItems.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              icon: Container(
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFEADDFF),
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  contactItems[index].name[0],
                                  style: const TextStyle(
                                    fontSize: 64,
                                    fontWeight: FontWeight.bold,
                                    //! show the selected contact color
                                    color: Color(0xFF6750A4),
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
                                contactItems[index].name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 20),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    "+62${contactItems[index].number}",
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),
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
                                      Navigator.pop(context, "Call"),
                                  icon: const Icon(Icons.phone),
                                  color: Colors.green,
                                ),
                                IconButton(
                                  onPressed: () =>
                                      Navigator.pop(context, "Call"),
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
                                  backgroundColor: const Color(0xFFEADDFF),
                                  child: Text(
                                    contactItems[index].name[0],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      //! show the selected contact color
                                      color: Color(0xFF6750A4),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        contactItems[index].name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF1C1B1F),
                                        ),
                                      ),
                                      Text(
                                        "+62${contactItems[index].number}",
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
                                    //! contact edit button
                                    IconButton(
                                      onPressed: () {
                                        _nameController.text =
                                            contactItems[index].name;
                                        _numberController.text =
                                            contactItems[index].number;
                                        _isUpdate = true;
                                        _selectedIndex = index;
                                      },
                                      icon: const Icon(Icons.edit_outlined),
                                    ),
                                    //! contact delete button
                                    IconButton(
                                      onPressed: () {
                                        Provider.of<DbManager>(context,
                                                listen: false)
                                            .deleteContact(
                                          contactItems[index].id!,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              "Contact successfully deleted.",
                                            ),
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
                  );
          },
        ),
        Consumer<DbManager>(
          builder: (context, manager, _) {
            return manager.contactModels.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actionsPadding: const EdgeInsets.all(20),
                              title: const Text(
                                  "Are you sure you want to permanently delete all contacts?"),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text(
                                    "No",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    Provider.of<DbManager>(context,
                                            listen: false)
                                        .deleteAllContact();
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "All contacts successfully deleted.",
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text("Yes"),
                                ),
                              ],
                              actionsAlignment: MainAxisAlignment.spaceBetween,
                            );
                          },
                        );
                      },
                      child: const Text("Clear All Contacts"),
                    ),
                  )
                : const SizedBox();
          },
        ),
      ],
    );
  }
}
