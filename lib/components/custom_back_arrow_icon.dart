import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackArrowIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.035),
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xffF5F6FA), shape: BoxShape.circle),
        child: SvgPicture.asset("assets/Images/arrow_left.svg",
            height: height * 0.06),
      ),
    );
  }
}
