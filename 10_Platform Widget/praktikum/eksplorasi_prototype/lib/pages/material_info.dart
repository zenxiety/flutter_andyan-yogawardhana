import 'package:flutter/material.dart';

class MyMaterialInfo extends StatefulWidget {
  const MyMaterialInfo({super.key});

  @override
  State<MyMaterialInfo> createState() => _MyMaterialInfoState();
}

class _MyMaterialInfoState extends State<MyMaterialInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                "INFO",
                style: TextStyle(
                  letterSpacing: 20,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.network(
                "https://giffiles.alphacoders.com/209/209159.gif"),
          )
        ],
      ),
    );
  }
}
