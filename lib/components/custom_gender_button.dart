import 'package:flutter/material.dart';

class CustomGenderButton extends StatelessWidget {
  String buttonName;
  bool isMen;

  CustomGenderButton({required this.buttonName, required this.isMen});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: isMen
                ? Theme.of(context).cardColor
                : Theme.of(context).splashColor,
            borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.075,
        child: Center(
            child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: isMen ? const Color(0xff8F959E) : const Color(0xffFFFFFF)),
        )),
      ),
    );
  }
}
