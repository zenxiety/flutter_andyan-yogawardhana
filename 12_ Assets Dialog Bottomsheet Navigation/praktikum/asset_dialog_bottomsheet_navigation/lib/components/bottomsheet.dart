import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future buildBottomSheet(BuildContext context, String image) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12),
      ),
    ),
    barrierColor: Colors.black87,
    builder: (context) => Container(
      margin: const EdgeInsets.all(20),
      height: 220,
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      "Open Image?",
                      textAlign: TextAlign.center,
                    ),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "No",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pushReplacementNamed(
                            context,
                            '/image_detail',
                            arguments: image,
                          ),
                          child: Text(
                            "Yes",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: image.contains("http")
                  ? Image.network(
                      image,
                      height: 160,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      image,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    ),
  );
}
