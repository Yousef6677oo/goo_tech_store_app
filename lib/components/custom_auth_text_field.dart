import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utilities/app_colors.dart';

class CustomAuthTextFiled extends StatefulWidget {
  String labelText;
  TextEditingController controller;
  Function validator;

  CustomAuthTextFiled(
      {required this.labelText,
      required this.controller,
      required this.validator});

  @override
  State<CustomAuthTextFiled> createState() => _CustomAuthTextFiledState();
}

class _CustomAuthTextFiledState extends State<CustomAuthTextFiled> {
  bool isCorrect = false;
  late double height;
  late double width;
  late bool isPassword;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    isPassword = isPasswordTextField(widget.labelText);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (value) {
          if (value.length > 3) {
            if (isPassword) {
              if (widget.validator(value) == null) {
                setState(() {
                  isCorrect = true;
                });
                return;
              }
            } else {
              if (widget.validator(value) == null) {
                setState(() {
                  isCorrect = true;
                });
                return;
              }
            }
            setState(() {
              isCorrect = false;
            });
          }
        },
        validator: (value) {
          return widget.validator(value);
        },
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).secondaryHeaderColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: height * 0.01),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: AppColors.labelColor),
          suffixIcon: isCorrect == true ? buildSuffixIcon() : null,
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

  Widget buildSuffixIcon() {
    if (isPassword) {
      return buildStrongSuffixIcon();
    } else {
      return buildCorrectSuffixIcon();
    }
  }

  Widget buildCorrectSuffixIcon() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: SvgPicture.asset("assets/Images/correct_icon.svg"),
    );
  }

  Widget buildStrongSuffixIcon() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.015),
      child: const Text(
        "Strong",
        style: TextStyle(
            fontSize: 12,
            fontFamily: 'Inter-VariableFont',
            color: Color(0xff34C559)),
      ),
    );
  }

  bool isPasswordTextField(String label) {
    return 'Password' == label;
  }
}
