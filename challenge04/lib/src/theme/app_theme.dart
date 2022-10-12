import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

const _primaryColor = Colors.purple;
const _secondarySwatch = Color.fromARGB(255, 255, 255, 255);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: _primaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 18),
      primary: Colors.white,
      onPrimary: Colors.black,
      minimumSize: const Size(kIsWeb ? 80 : double.infinity, 48),
    ),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    backgroundColor: Colors.purple,
    iconTheme: IconThemeData(color: Colors.white),
  ),
);

ThemeData dartTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: _primaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.black,
      onPrimary: Colors.purple,
    ),
  ),
);
