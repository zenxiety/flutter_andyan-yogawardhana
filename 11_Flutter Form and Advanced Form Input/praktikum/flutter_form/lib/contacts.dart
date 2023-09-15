import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_form/picker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  // form key
  final _formKey = GlobalKey<FormState>();
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

  // function untuk menghandle function button ketika di-tap (submit & edit button)
  void handleSubmit({int index = -1}) {
    // jika edit button yang di-tap
    if (index >= 0) {
      editContact(index);

      return;
    }

    // // jika user melakukan tap submit button tetapi ada field yang masih kosong
    // if (nameController.text == '' || numberController.text == '') {
    //   nameController.text == ''
    //       // autofocus ke salah satu field yang belum diisi
    //       ? nameFocusNode.requestFocus()
    //       : numberFocusNode.requestFocus();
    //   snackBarPopup(message: "Please fill in both name and number fields.");

    //   return;
    // }

    // // jika nama kurang dari 2 kata
    // if (!nameController.text.trim().contains(" ")) {
    //   // snackBarPopup(message: "Name must consist of at least 2 words.");
    //   nameFocusNode.requestFocus();
    //   return;
    // }

    // if (!RegExp(r"^[A-Za-z\s]*$").hasMatch(nameController.text)) {
    //   nameFocusNode.requestFocus();
    //   return;
    // }

    // if (!RegExp(r"^([A-Z][A-Za-z]*[ ]?)*$").hasMatch(nameController.text)) {
    //   nameFocusNode.requestFocus();
    //   return;
    // }

    // // nomor telepon minimal 8 digit
    // if (numberController.text.length < 8) {
    //   // snackBarPopup(message: "Phone number must consist of at least 8 digits.");
    //   numberFocusNode.requestFocus();
    //   return;
    // }

    setState(() {
      // handle edit data
      if (selectedContact >= 0) {
        contacts[selectedContact]['name'] = nameController.text;
        contacts[selectedContact]['number'] = numberController.text;
        contacts[selectedContact]['date'] =
            DateFormat(_dateFormat).format(_dueDate);
        contacts[selectedContact]['color'] = _currentColor.toString();
        contacts[selectedContact]['file'] = _file.toString();
        selectedContact = -1;

        snackBarPopup(message: "The contact has been edited successfully");
      }
      // handle tambah data
      else {
        contacts.add({
          'name': nameController.text,
          'number': numberController.text,
          'date': DateFormat(_dateFormat).format(_dueDate),
          'color': _currentColor.toString(),
          'file': _file.name.toString(),
        });

        snackBarPopup(message: "The contact has been added successfully");
      }

      // reset field data
      _dueDate = DateTime.now();
      _currentColor = Colors.black;
      _file = PlatformFile(name: '', size: 0);
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

      final String date = contacts[i]['date']!;
      final String color = contacts[i]['color']!;

      if (date != '') {
        _dueDate = DateFormat(_dateFormat).parse(date!);
      }

      _currentColor = _colorFrom(color);
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
    _dueDate = DateTime.now();
    _currentColor = Colors.black;
    _file = PlatformFile(name: '', size: 0);
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

  DateTime _dueDate = DateTime.now();
  final String _dateFormat = "EEEE, dd MMMM yyyy";

  Color _currentColor = Colors.black;

  PlatformFile _file = PlatformFile(name: '', size: 0);

  void _pickDate() async {
    final selectDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    setState(() {
      if (selectDate != null) _dueDate = selectDate;
    });
  }

  void _pickColor() {
    showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: const Text("Pick Your Color"),
            content: BlockPicker(
              pickerColor: _currentColor,
              onColorChanged: (color) {
                setState(() {
                  _currentColor = color;
                });
              },
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ],
          ),
        );
      },
    );
  }

  // mendapatkan widget Color dari string hex
  Color _colorFrom(String string) {
    final String strVal = string.split("(0x")[1].split(")")[0];
    final int intVal = int.parse(strVal, radix: 16);

    return Color(intVal);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: <String>[
        'jpg',
        'jpeg',
        'png',
      ],
    );
    if (result == null) return;

    final file = result.files.first;

    // _openFile(file);

    setState(() {
      _file = file;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    nameFocusNode.unfocus();
    numberFocusNode.unfocus();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            TextButton(
              child: const Text("Contacts"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ContactsPage()),
                );
              },
            ),
            TextButton(
              child: const Text("Picker"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const PickerPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          contactHero(context),
          contactForm(context),
          contactList(context),
        ],
      ),
    );
  }

  Widget contactHero(BuildContext context) {
    return Container(
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
    );
  }

  Widget contactForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                String invalidName = "";
                if (value == "") return null;

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
              focusNode: nameFocusNode,
              controller: nameController,
              // onChanged: (value) => setState(() {
              //   nameController.text = value;
              // }),
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(
              //     RegExp(
              //       '([A-Z][A-Za-z]*[ ]?)*', // setiap kata diawali kapital, hanya huruf, tidak mengandung angka/karakter
              //     ),
              //   )
              // ],
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                if (value == "") return null;

                if (value!.length < 8 || value.length > 15) {
                  invalidNumber +=
                      "Phone number must consist of at least 8 digits.\n";
                }

                if (!RegExp(r"^[0][0-9]*$").hasMatch(value)) {
                  invalidNumber += "Phone number must start with \"0\".\n";
                }

                return (invalidNumber != "") ? invalidNumber : null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              focusNode: numberFocusNode,
              controller: numberController,
              // onChanged: (value) => setState(() {
              //   numberController.text = value;
              // }),
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Contact Details Picker",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Column(
              children: <Widget>[
                //* DATE PICKER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        _pickDate();
                      },
                      child: const Text("Date"),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          DateFormat(_dateFormat).format(_dueDate),
                        ),
                        IconButton(
                          icon: const Icon(Icons.date_range_rounded),
                          color: const Color(0xFF6750A4),
                          onPressed: () {
                            _pickDate();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                //* COLOR PICKER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        _pickColor();
                      },
                      child: const Text("Color"),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "#${_currentColor.toString().split('(0xff')[1].split(')')[0].toUpperCase()}",
                        ),
                        InkWell(
                          onTap: () {
                            _pickColor();
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 14),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: _currentColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //* FILE PICKER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        _pickFile();
                      },
                      child: const Text("File (Image)"),
                    ),
                    Row(
                      children: <Widget>[
                        _file.size != 0
                            ? IconButton(
                                color: Colors.pink,
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (builder) {
                                      return AlertDialog(
                                        title:
                                            const Text("Delete Selected File?"),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Cancel"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                _file = PlatformFile(
                                                  name: "",
                                                  size: 0,
                                                );
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Delete"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              )
                            : const SizedBox(),
                        Text(
                          _file.size != 0
                              ? _file.name.toString()
                              : "No file selected.",
                        ),
                        IconButton(
                          color: _file.size != 0 ? Colors.blue : Colors.grey,
                          icon: const Icon(Icons.preview),
                          onPressed: () {
                            _file.size != 0
                                ? showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          _file.name.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Image.file(
                                          File(_file.path!),
                                        ),
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        actions: <Widget>[
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Back"),
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                : null;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        handleSubmit();
                      } else {
                        snackBarPopup(
                          message: "Please enter the valid contact information",
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
    );
  }

  Widget contactList(BuildContext context) {
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
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w600,
                          //! show the selected contact color
                          color: _colorFrom(contacts[index]['color']!),
                          shadows: const <Shadow>[
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
                      contacts[index]['name']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "+62${contacts[index]['number']!}",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                          ),
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFEADDFF),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                //! show the selected contact file
                                contacts[index]['file']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFEADDFF),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                //! show the selected contact date
                                contacts[index]['date']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconButton(
                        onPressed: () => Navigator.pop(context, "Message"),
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
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: const Color(0xFFEADDFF),
                        // backgroundImage: FileImage(
                        //   File(
                        //     contacts[index]['file']!,
                        //   ),
                        // ),
                        child: Text(
                          contacts[index]['name']![0],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            //! show the selected contact color
                            color: _colorFrom(contacts[index]['color']!),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              contacts[index]['name']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF1C1B1F),
                              ),
                            ),
                            Text(
                              "+62${contacts[index]['number']!}",
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
    );
  }
}
