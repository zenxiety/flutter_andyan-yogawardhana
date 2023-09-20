import 'package:asset_dialog_bottomsheet_navigation/components/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildGalleryGrid({required List<String> images}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            buildBottomSheet(context, images[index]);
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: images[index].contains("http")
                  ? Image.network(
                      images[index],
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        return loadingProgress == null
                            ? child
                            : Center(
                                child: Text(
                                  "Image Loading...",
                                  style: GoogleFonts.poppins(),
                                ),
                              );
                      },
                    )
                  : Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        );
      },
    ),
  );
}
