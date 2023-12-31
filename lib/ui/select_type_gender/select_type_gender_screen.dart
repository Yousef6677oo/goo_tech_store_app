import 'package:e_commerce_app/data/hive_manager.dart';
import 'package:flutter/material.dart';

import '../../components/custom_gender_button.dart';
import '../authentication_way/authentication_way_screen.dart';

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
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(isDarkMode
                  ? 'assets/Images/dark_screen_for_test.png'
                  : 'assets/Images/light_screen_for_test.png'),
              fit: BoxFit.fill),
        ),
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
                          onTap: () async {
                            await HiveManager.myBox?.put('gender', 'male');
                            navigateToCreateAccountScreen();
                          },
                          child: CustomGenderButton(
                            buttonName: "Men",
                            isMen: true,
                          ),
                        ),
                        SizedBox(width: width * 0.03),
                        InkWell(
                          onTap: () async {
                            await HiveManager.myBox?.put('gender', 'female');
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
    Navigator.pushNamed(context, AuthenticationWayScreen.routeName);
  }
}
