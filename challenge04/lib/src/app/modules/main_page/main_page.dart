import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../intro_page/intro_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: IntroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
