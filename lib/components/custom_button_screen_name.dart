import 'package:flutter/material.dart';

class CustomButtonScreenName extends StatelessWidget {
  String screenName;

  CustomButtonScreenName({required this.screenName});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).bottomAppBarTheme.color,
      width: width,
      height: height * 0.11,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        child: Text(
          screenName,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xffFEFEFE)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
