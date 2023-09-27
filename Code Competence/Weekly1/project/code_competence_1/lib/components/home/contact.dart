import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageContact extends StatelessWidget {
  const HomePageContact({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController messageController = TextEditingController();

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Contact Us",
            style: GoogleFonts.bebasNeue(fontSize: 36),
          ),
          const Text(
            "Need to get in touch with us?",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: firstNameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: "First Name",
                        ),
                        validator: (value) {
                          return value == '' ? 'First name is required.' : null;
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: lastNameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: "Last Name",
                        ),
                        validator: (value) {
                          return value == '' ? 'Last name is required.' : null;
                        },
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value == '') return 'Email is required';

                    String error = '';

                    if (!RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                        .hasMatch(value!)) {
                      error += "Please enter a valid email address.";
                    }

                    return error == '' ? null : error;
                  },
                ),
                TextFormField(
                  controller: messageController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: "What can we help you with?",
                  ),
                  maxLines: null,
                  validator: (value) {
                    return value!.length <= 1
                        ? "Please describe your thoughts"
                        : null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            alignment: Alignment.center,
                            title: Text(
                              "Message Confirmation",
                              style: GoogleFonts.bebasNeue(fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                            content: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                ),
                                ListView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Text(
                                        "${firstNameController.text} ${lastNameController.text}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      height: 0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Text(
                                        emailController.text,
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      height: 0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Text(
                                        messageController.text,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                            actions: <Widget>[
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  firstNameController.clear();
                                  lastNameController.clear();
                                  emailController.clear();
                                  messageController.clear();

                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                        "Message sent! Please kindly wait for our response :)",
                                      ),
                                      action: SnackBarAction(
                                        label: "OK",
                                        onPressed: () {},
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.send,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
