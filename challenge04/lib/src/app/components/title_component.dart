import 'package:flutter/material.dart';

class TitlePattern extends StatelessWidget {
  final String titleText;

  TitlePattern({required this.titleText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: 130,
          width: 350,
          child: Text(
            titleText,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          )
        )
      )
    );
  }
}