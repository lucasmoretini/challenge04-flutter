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
          decoration: BoxDecoration(
            color: Colors.purple,
            border: Border.all(
              color: Colors.purple,
              width: 5
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
          height: 80,
          width: 290,
          child: Text(
            titleText,
            style: TextStyle(
              fontSize: 28,
              color: Colors.white
            ),
          )
        )
      )
    );
  }
}