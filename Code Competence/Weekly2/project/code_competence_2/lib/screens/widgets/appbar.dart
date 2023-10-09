import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BaseAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.bebasNeue(),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.swipe_down_sharp,
            size: 18,
          ),
        ],
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff000000), Color.fromARGB(255, 41, 65, 100)],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Scaffold.of(context).openEndDrawer(),
          icon: const Icon(Icons.menu_open_rounded),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
