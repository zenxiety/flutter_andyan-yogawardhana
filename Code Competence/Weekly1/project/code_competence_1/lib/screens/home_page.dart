import 'package:code_competence_1/components/appbar.dart';
import 'package:code_competence_1/components/home/contact.dart';
import 'package:code_competence_1/components/home/hero.dart';
import 'package:code_competence_1/components/home/title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Keep On Scrolling"),
      body: ListView(
        children: const <Widget>[
          HomePageHero(),
          HomePageTitle(),
          HomePageContact(),
        ],
      ),
    );
  }
}
