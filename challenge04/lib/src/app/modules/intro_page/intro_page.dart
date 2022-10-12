import 'package:flutter/material.dart';
import '../../components/button_component.dart';
import '../../components/custom_scrollview_component.dart';
import '../../components/form_outline_component.dart';
import '../../utils/export.dart';
import '../recomendation_page/recomendation_page.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    navigateToSpaceShipScreen() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => RecomendationPage(),
        ),
      );
    }

    Widget Form({required BuildContext context}) {
      return Padding(
        padding: EdgeInsets.only(
          left: AppPaddings.borderPadding,
          right: AppPaddings.borderPadding,
          bottom: 60,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FormOutlinePattern(label: eMail),
            const SizedBox(height: 15),
            FormOutlinePattern(label: password),
            const SizedBox(height: 30),
            ButtonPattern(
              onPressed: navigateToSpaceShipScreen,
              buttonText: entry
            )
          ],
        ),
      );
    }

    var image = Image.asset(
      "assets/images/truck.jpeg",
      width: 450.00,
      height: 300.00,
      alignment: Alignment.topCenter,
    );

    var textIntro = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(height: 8),
        Text(
          "Scania",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        Text(
          "Entre na sua conta!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 8),
      ],
    );

    return Scaffold(
      body: CustomScrollViewComponent(
        child: Column(
          children: [
            image,
            Expanded(
              flex: 1,
              child: textIntro,
            ),
            Expanded(
              flex: 2,
              child: Form(context: context),
            ),
          ],
        ),
      ),
    );
  }
}
