import 'package:flutter/material.dart';

import '../../components/custom_gender_button.dart';
import '../choose_way_to_authenticate/choose_way_to_authenticate_screen.dart';

class SelectTypeGenderScreen extends StatefulWidget {
  static const String routeName = "select_type_gender_screen";

  @override
  State<SelectTypeGenderScreen> createState() => _SelectTypeGenderScreenState();
}

class _SelectTypeGenderScreenState extends State<SelectTypeGenderScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Images/screen_1_for_test.png'),
                fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.31,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: height * 0.03),
                    Text(
                      "Look Good, Feel Good",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).secondaryHeaderColor,
                          fontFamily: 'Inter-VariableFont'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.015),
                    const Text("Create your individual & unique style and",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff8F959E)),
                        textAlign: TextAlign.center),
                    SizedBox(height: height * 0.007),
                    const Text("look amazing everyday.",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff8F959E)),
                        textAlign: TextAlign.center),
                    SizedBox(height: height * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            navigateToCreateAccountScreen();
                          },
                          child: CustomGenderButton(
                            buttonName: "Men",
                            isMen: true,
                          ),
                        ),
                        SizedBox(width: width * 0.03),
                        InkWell(
                          onTap: () {
                            navigateToCreateAccountScreen();
                          },
                          child: CustomGenderButton(
                            buttonName: "Women",
                            isMen: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    InkWell(
                      onTap: () {
                        navigateToCreateAccountScreen();
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                            color: Color(0xff8F959E)),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.017,
            )
          ],
        ),
      ),
    );
  }

  navigateToCreateAccountScreen() {
    Navigator.pushNamed(context, ChooseWayToAuthenticateScreen.routeName);
  }
}
