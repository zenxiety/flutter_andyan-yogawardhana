import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  // controller untuk input
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  // handle focus untuk input field
  FocusNode nameFocusNode = FocusNode();
  FocusNode numberFocusNode = FocusNode();
  // untuk meng-unfocus input field
  UnfocusDisposition disposition = UnfocusDisposition.scope;

  // selector untuk edit data kontak
  int selectedContact = -1;

  // default value daftar kontak
  final List<Map<String, String>> contacts = <Map<String, String>>[
    {'name': 'Name A', 'number': '123456781'},
    {'name': 'Name B', 'number': '123456782'},
    {'name': 'Name C', 'number': '123456783'},
    {'name': 'Name D', 'number': '123456784'},
  ];

  // function untuk menghandle function button ketika di-tap (submit & edit button)
  void handleSubmit({int index = -1}) {
    // jika edit button yang di-tap
    if (index >= 0) {
      editContact(index);

      return;
    }

    // jika user melakukan tap submit button tetapi ada field yang masih kosong
    if (nameController.text == '' || numberController.text == '') {
      nameController.text == ''
          // autofocus ke salah satu field yang belum diisi
          ? nameFocusNode.requestFocus()
          : numberFocusNode.requestFocus();
      snackBarPopup(message: "Please fill in both name and number fields.");

      return;
    }

    // jika nama kurang dari 2 kata
    if (!nameController.text.trim().contains(" ")) {
      snackBarPopup(message: "Name must consist of at least 2 words.");
      nameFocusNode.requestFocus();

      return;
    }

    // nomor telepon minimal 8 digit
    if (numberController.text.length < 8) {
      snackBarPopup(message: "Phone number must consist of at least 8 digits.");
      numberFocusNode.requestFocus();

      return;
    }

    setState(() {
      // handle edit data
      if (selectedContact >= 0) {
        contacts[selectedContact]['name'] = nameController.text;
        contacts[selectedContact]['number'] = numberController.text;
        selectedContact = -1;

        snackBarPopup(message: "The contact has been edited successfully");
      }
      // handle tambah data
      else {
        contacts.add(
            {'name': nameController.text, 'number': numberController.text});

        snackBarPopup(message: "The contact has been added successfully");
      }

      // menghilangkan focus field setelah submit
      nameFocusNode.unfocus();
      numberFocusNode.unfocus();
      // primaryFocus!.unfocus(disposition: disposition);
    });

    // menghapus value field setelah submit
    nameController.clear();
    numberController.clear();

    // prefix dan suffix untuk mengubah warna text pada console
    debugPrint("\x1B[34m${contacts.toString()}\x1B[34m");
  }

  // handle edit data kontak
  void editContact(int i) {
    // mengubah selector item kontak ke index item tersebut
    setState(() {
      selectedContact = i;
    });
    // mengisi input field ke value kontak yang akan diedit
    nameController.text = contacts[i]['name'] ?? '';
    numberController.text = contacts[i]['number'] ?? '';
    // autofocus ke input field nama
    nameFocusNode.requestFocus();
  }

  // handle hapus data kontak
  void deleteContact(int i) {
    setState(() {
      // menghapus sesuai index kontak yang di-tap
      contacts.removeAt(i);
    });

    snackBarPopup(message: "The contact has been deleted successfully");
  }

  // handle cancel edit data kontak
  void handleCancel() {
    setState(() {
      selectedContact = -1;
    });
    nameController.clear();
    numberController.clear();
    nameFocusNode.unfocus();
    numberFocusNode.unfocus();

    snackBarPopup(message: "The editing process has been cancelled.");
  }

  /// menampilkan popup yang berkaitan setelah suatu proses selesai dikerjakan
  void snackBarPopup({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(label: "OK", onPressed: () {}),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
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
            child: Column(
              children: <Widget>[
                TextField(
                  focusNode: nameFocusNode,
                  controller: nameController,
                  onChanged: (value) => setState(() {
                    nameController.text = value;
                  }),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(
                        '([A-Z][A-Za-z]*[ ]?)*', // setiap kata diawali kapital, hanya huruf, tidak mengandung angka/karakter
                      ),
                    )
                  ],
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "Insert Your Name",
                    labelText: "Name",
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  focusNode: numberFocusNode,
                  controller: numberController,
                  onChanged: (value) => setState(() {
                    numberController.text = value;
                  }),
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
                      selectedContact != -1
                          ? OutlinedButton(
                              onPressed: () => handleCancel(),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(fontSize: 14),
                              ),
                            )
                          : const Spacer(),
                      ElevatedButton(
                        onPressed: () => handleSubmit(),
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
          Column(
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
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(parent: null),
                  itemCount: contacts.length,
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
                              contacts[index]['name']![0],
                              style: const TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF21005D),
                              ),
                            ),
                          ),
                          title: Text(
                            contacts[index]['name'].toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20),
                          ),
                          content: Text(
                            "+62${contacts[index]['number'].toString()}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF49454F),
                              fontSize: 14,
                            ),
                          ),
                          actions: <Widget>[
                            IconButton(
                              onPressed: () =>
                                  Navigator.pop(context, "Message"),
                              icon: const Icon(Icons.message),
                              color: Colors.lightBlue,
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context, "Call"),
                              icon: const Icon(Icons.phone),
                              color: Colors.green,
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context, "Call"),
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
                              foregroundColor: const Color(0xFF21005D),
                              child: Text(
                                contacts[index]['name']![0],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF1C1B1F),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    contacts[index]['name'].toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF1C1B1F),
                                    ),
                                  ),
                                  Text(
                                    "+62${contacts[index]['number'].toString()}",
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
                                IconButton(
                                  onPressed: () => handleSubmit(index: index),
                                  icon: const Icon(Icons.edit_outlined),
                                ),
                                IconButton(
                                  onPressed: () => deleteContact(index),
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
          )
        ],
      ),
    );
  }
}
