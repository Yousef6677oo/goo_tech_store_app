import 'package:e_commerce_app/utilities/app_colors.dart';
import 'package:flutter/material.dart';

import '../select_type_gender/select_type_gender_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.pushReplacementNamed(
            context, SelectTypeGenderScreen.routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'NEAR TECH',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                fontFamily: 'Antonio-VariableFont',
                letterSpacing: 10,
                color: AppColors.primaryColorLight),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
