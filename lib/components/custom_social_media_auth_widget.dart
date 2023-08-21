import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSocialMediaAuthWidget extends StatelessWidget {
  String name;
  String pathIcon;
  Color color;

  CustomSocialMediaAuthWidget(
      {required this.name, required this.color, required this.pathIcon});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 1,
              child: SvgPicture.asset(
                pathIcon,
                height: 20,
                fit: BoxFit.fitHeight,
              ),
            ),
            //SizedBox(width: width * 0.05),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'SF-Pro-Text-Semibold',
                      color: Color(0xffFFFFFF)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
