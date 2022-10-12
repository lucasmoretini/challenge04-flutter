import 'package:challenge04/src/app/modules/intro_page/intro_page.dart';
import 'package:flutter/material.dart';

import 'src/theme/app_theme.dart';

void main() {
  runApp(TruckDriverApp());
}

class TruckDriverApp extends StatefulWidget {
  const TruckDriverApp({Key? key}) : super(key: key);

  @override
  State<TruckDriverApp> createState() => _TruckDriverAppState();
}

class _TruckDriverAppState extends State<TruckDriverApp> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => IntroPage()
      },
    );
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }
}
