import 'package:flutter/cupertino.dart';

class MyCupertinoLayout extends StatelessWidget {
  const MyCupertinoLayout({super.key});

  static const _themeDark = CupertinoThemeData.raw(
      Brightness.dark, null, null, null, null, null, null);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: _themeDark,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("CupertinoApp"),
        ),
        child: Center(
          child: Text('This is CupertinoApp'),
        ),
      ),
    );
  }
}
