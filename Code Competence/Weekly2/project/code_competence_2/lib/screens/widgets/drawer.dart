import 'package:code_competence_2/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BaseDrawer extends StatefulWidget {
  final ScrollController sc;

  const BaseDrawer({super.key, required this.sc});

  @override
  State<BaseDrawer> createState() => _BaseDrawerState();
}

class _BaseDrawerState extends State<BaseDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      width: MediaQuery.of(context).size.width / 3,
      child: Padding(
        padding: const EdgeInsets.only(top: 32, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Consumer<HomeProvider>(
              builder: (context, state, _) {
                return TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                  ),
                  onPressed: () {
                    state.scrollTo(context: context, index: 2);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Contact Us",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                      letterSpacing: 2,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
            Consumer<HomeProvider>(
              builder: (context, state, _) {
                return TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                  ),
                  onPressed: () {
                    state.scrollTo(context: context, index: 1);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "About Us",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                      letterSpacing: 2,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
              ),
              onPressed: () {},
              child: Text(
                "Login",
                style: GoogleFonts.bebasNeue(
                  fontSize: 20,
                  letterSpacing: 2,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
