import 'package:challenge04/src/app/utils/export.dart';
import 'package:flutter/material.dart';
import '../../components/button_component.dart';
import '../../components/custom_scrollview_component.dart';
import '../trucker_registration_page/truck_driver_registration_page.dart';
import '../truckers_apresentation_page/truck_driver_apresentation_page.dart';

class RecomendationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    navigateToTruckRegistration() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TruckDriverRegistration(),
        ),
      );
    }

    navigateToTruckList() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TruckDriverApresentation(),
        ),
      );
    }

    Widget Form({required BuildContext context}) {
      return Padding(
        padding: EdgeInsets.only(
          left: AppPaddings.borderPadding,
          right: AppPaddings.borderPadding,
          bottom: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 15),
            ButtonPattern(
              onPressed: navigateToTruckRegistration,
              buttonText: registrationButton,
              primaryColor: const Color.fromARGB(255, 101, 2, 194),
              secondColor: Colors.white,
            ),
            const SizedBox(height: 10),
             ButtonPattern(
              onPressed: navigateToTruckList,
              buttonText: listDriveTruckButton,
              primaryColor: const Color.fromARGB(255, 101, 2, 194),
              secondColor: Colors.white,
            ),
          ],
        ),
      );
    }

    var image = Image.asset(
      "assets/images/scania-logo.jpg",
      width: 450.00,
      height: 350.00,
      alignment: Alignment.topCenter,
    );

    var textIntro = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        SizedBox(height: 40),
        Text(
          "Scania",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        Text(
          "A melhor opção para sua frota!",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 8),
      ],
    );

    return Scaffold(
      body: CustomScrollViewComponent(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: textIntro,
            ),
            image,
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
