import 'package:code_competence_2/providers/home_provider.dart';
import 'package:code_competence_2/screens/widgets/appbar.dart';
import 'package:code_competence_2/screens/widgets/drawer.dart';
import 'package:code_competence_2/screens/widgets/home/contact.dart';
import 'package:code_competence_2/screens/widgets/home/hero.dart';
import 'package:code_competence_2/screens/widgets/home/about.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, state, _) {
        return Scaffold(
          appBar: const BaseAppBar(title: "Keep On Scrolling"),
          endDrawer: BaseDrawer(sc: state.scrollController),
          drawerScrimColor: Colors.black87,
          body: ListView(
            controller: state.scrollController,
            children: const <Widget>[
              HomePageHero(),
              HomePageTitle(),
              HomePageContact(),
            ],
          ),
        );
      },
    );
  }
}
