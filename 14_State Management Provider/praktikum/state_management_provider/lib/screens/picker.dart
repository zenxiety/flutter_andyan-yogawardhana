import 'package:asset_dialog_bottomsheet_navigation/components/appbar.dart';
import 'package:asset_dialog_bottomsheet_navigation/components/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

import '../stores/color.dart' as color_store;

class PickerPage extends StatefulWidget {
  const PickerPage({super.key});

  @override
  State<PickerPage> createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
      ],
    );
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Interactive Widgets"),
      drawer: const BaseDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            buildDatePicker(context),
            const Divider(height: 32, color: Color(0xFF6750A4)),
            buildColorPicker(context),
            const Divider(height: 32, color: Color(0xFF6750A4)),
            buildFilePicker(),
            const Divider(height: 32, color: Color(0xFF6750A4)),
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text("Date"),
            TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currentDate.year + 5),
                );

                setState(() {
                  if (selectDate != null) _dueDate = selectDate;
                });
              },
              child: const Text("Select"),
            ),
          ],
        ),
        Text(
          DateFormat("EEEE, dd MMMM yyyy").format(_dueDate),
          style: GoogleFonts.poppins(),
        )
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    final colorProvider = Provider.of<color_store.ColorState>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("Color"),
        const SizedBox(height: 10),
        Container(
          height: 100,
          width: double.infinity,
          color: colorProvider.color,
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(colorProvider.color),
            ),
            child: const Text("Pick Color"),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Pick Your Color"),
                    content: BlockPicker(
                      pickerColor: colorProvider.color,
                      onColorChanged: (color) {
                        colorProvider.changeColor(color);
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
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }

  Widget buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("Pick Files"),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            child: const Text("Pick and Open File"),
            onPressed: () {
              _pickFile();
            },
          ),
        )
      ],
    );
  }
}
