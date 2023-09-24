import '../components/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../stores/color.dart' as color_store;
import '../stores/contact.dart' as contact_store;

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _formKey = GlobalKey<FormState>();

  final List<String> messages = [
    "Message One",
    "Message Two",
    "Officia commodo do dolore veniam esse veniam non nulla. Aute proident nulla quis occaecat enim qui officia.",
    "Message Four",
    "Consectetur pariatur nostrud in aliquip elit ea laboris ipsum quis. Id sunt ut anim aliquip anim nulla do ea culpa consectetur. Duis exercitation labore cillum irure qui minim officia nisi dolore cillum mollit. Anim sit ea non ipsum nostrud consectetur ea dolore aute. Velit incididunt sunt cillum cillum. Qui veniam velit anim proident eiusmod voluptate aliqua dolor cillum in voluptate dolor consectetur. Non officia cillum dolor anim ipsum do laboris nisi irure sunt velit est et. Laborum do fugiat id ex aliqua Lorem consectetur Lorem veniam irure esse labore in do. Qui nostrud consectetur elit sit elit ut Lorem eiusmod labore nulla esse ut ut laboris. Ex est excepteur proident consequat magna enim labore laborum veniam do velit sit. Nostrud deserunt amet do nisi cillum in sint amet ipsum ea. Ipsum duis cillum amet ex quis tempor consectetur anim et mollit nisi ea commodo. Consectetur aliquip elit ea aliquip eu qui minim minim cillum deserunt.",
    "Sit consectetur amet pariatur do consectetur sint sint occaecat dolor eiusmod commodo magna amet. Laborum fugiat irure dolore sunt excepteur ut eu commodo reprehenderit laborum commodo ipsum. Ullamco ut sint veniam in magna nulla. Ut sint ad nostrud duis tempor laboris consequat velit ex excepteur fugiat. Non elit aliqua exercitation incididunt sit qui ea dolor minim cillum. Laboris pariatur voluptate irure do. In ea nostrud qui sunt consequat nostrud. Labore nisi quis minim minim consequat ad qui ea. Labore id irure ea veniam sit ipsum esse consectetur enim. Aliquip ipsum pariatur sunt dolor quis ea sit excepteur aliqua. Eiusmod magna ipsum qui magna. Tempor consequat et ex culpa sint.",
  ];

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<contact_store.Contact>(context);
    final colorProvider = Provider.of<color_store.ColorState>(context);
    final contactIndex = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar:
          BaseAppBar(title: contactProvider.contacts[contactIndex]['name']!),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(8),
                margin: EdgeInsets.only(
                  top: (index == 0 ? 8 : 0),
                  bottom: (index == messages.length - 1 ? 64 : 4),
                ),
                decoration: BoxDecoration(
                  color: colorProvider.color,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  messages[index],
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
              ),
            ),
          ),
          Container(
            color: colorProvider.color,
            child: Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.attachment),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter a message",
                        focusedBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
