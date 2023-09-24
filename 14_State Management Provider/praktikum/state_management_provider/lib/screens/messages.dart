import 'package:asset_dialog_bottomsheet_navigation/components/appbar.dart';
import 'package:asset_dialog_bottomsheet_navigation/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../stores/color.dart' as color_store;
import '../stores/contact.dart' as contact_store;

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<color_store.ColorState>(context);
    final contactProvider = Provider.of<contact_store.Contact>(context);

    return Scaffold(
      appBar: const BaseAppBar(title: "Messages"),
      drawer: const BaseDrawer(),
      body: const Center(
        child: Text("Messages"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Select Contact"),
              content: ListView.builder(
                itemCount: contactProvider.contacts.length,
                itemBuilder: (context, index) {
                  final name = contactProvider.contacts[index]['name'];
                  final number = contactProvider.contacts[index]['number'];
                  final color = contactProvider.contacts[index]['color'];

                  return InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                        context,
                        '/new_message',
                        arguments: index,
                      );
                      debugPrint(index.toString());
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: colorFromHex(
                            color!.split("Color(0xff")[1].split(")")[0]),
                        foregroundColor: colorProvider.color,
                        child: Text(name![0]),
                      ),
                      title: Text(name),
                      subtitle: Text(number!),
                    ),
                  );
                },
              ),
            );
          },
        ),
        backgroundColor: colorProvider.color,
        child: const Icon(Icons.chat),
      ),
    );
  }
}
