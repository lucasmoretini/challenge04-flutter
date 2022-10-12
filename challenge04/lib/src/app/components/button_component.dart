import 'package:flutter/material.dart';

class ButtonPattern extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final Color primaryColor;
  final Color secondColor;

  ButtonPattern(
      {required this.onPressed,
      required this.buttonText,
      required this.primaryColor,
      required this.secondColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          onPrimary: secondColor,
        ),
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}
