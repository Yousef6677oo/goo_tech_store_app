import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIncrementDecrementButton extends StatelessWidget {
  String iconPath;

  CustomIncrementDecrementButton(this.iconPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(17.5),
        border: Border.all(color: const Color(0xffDEDEDE), width: 1),
      ),
      child: SvgPicture.asset(iconPath),
    );
  }
}
