import 'package:code_competence_2/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageContact extends StatelessWidget {
  const HomePageContact({super.key});

  @override
  Widget build(BuildContext context) {
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
          Consumer<ContactProvider>(
            builder: (context, state, _) {
              return Form(
                key: state.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            controller: state.firstNameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "First Name",
                              labelStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            validator: (value) {
                              return state.validateName(value);
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: state.lastNameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Last Name",
                              labelStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            validator: (value) {
                              return state.validateName(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: state.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                      ),
                      validator: (value) {
                        return state.validateEmail(value);
                      },
                    ),
                    TextFormField(
                      controller: state.messageController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: "What can we help you with?",
                        labelStyle:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                      ),
                      maxLines: null,
                      validator: (value) {
                        return state.validateMessage(value);
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      //! submit button
                      child: const Text('Submit'),
                      onPressed: () {
                        state.handleSubmit(context);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
