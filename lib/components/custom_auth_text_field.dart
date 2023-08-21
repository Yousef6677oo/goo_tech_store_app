import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';

class CustomAuthTextFiled extends StatelessWidget {
  String labelText;
  TextEditingController controller;
  Function validator;

  CustomAuthTextFiled(
      {required this.labelText,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          return validator(value);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: height * 0.01),
          labelText: labelText,
          labelStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: AppColors.labelColor),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffE7E8EA), width: 2),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffE7E8EA), width: 2),
          ),
        ),
      ),
    );
  }
}
