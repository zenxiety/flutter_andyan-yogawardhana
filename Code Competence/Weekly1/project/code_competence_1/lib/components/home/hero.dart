import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageHero extends StatelessWidget {
  const HomePageHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "assets/images/hero-bg.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Text(
            "Keep On Scrolling",
            style: GoogleFonts.bebasNeue(
                fontSize: 128,
                fontWeight: FontWeight.w900,
                height: 0.8,
                letterSpacing: 20,
                color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
