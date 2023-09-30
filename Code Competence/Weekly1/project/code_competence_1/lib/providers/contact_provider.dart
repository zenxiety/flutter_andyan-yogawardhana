import 'package:code_competence_1/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactProvider extends ChangeNotifier {
  final ContactModel contact = ContactModel(
    firstName: '',
    lastName: '',
    email: '',
    message: '',
  );

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String? validateName(String? value) {
    return value == '' ? 'Required' : null;
  }

  String? validateEmail(String? value) {
    if (value == '') return 'Email address is required';

    String error = '';

    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value!)) {
      error += "Please enter a valid email address";
    }

    return error == '' ? null : error;
  }

  String? validateMessage(String? value) {
    return value!.length <= 1 ? "Please describe your thoughts" : null;
  }

  void handleSubmit(BuildContext context) {
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
  }
}
