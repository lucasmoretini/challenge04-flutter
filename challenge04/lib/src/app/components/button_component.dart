import 'package:flutter/material.dart';

class ButtonPattern extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;

  ButtonPattern({required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
        ),
      ),
    );
  }
}
