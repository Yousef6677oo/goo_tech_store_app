import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController controller;
  String labelText;
  String hintText;
  int maxLines;

  CustomTextField(
      {required this.labelText,
      required this.hintText,
      required this.controller,
      required this.maxLines});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).secondaryHeaderColor)),
        SizedBox(height: height * 0.015),
        TextField(
          minLines: null,
          maxLines: widget.maxLines,
          showCursor: false,
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontFamily: 'Inter-VariableFont',
                color: Color(0xff8F959E),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              fillColor: Theme.of(context).cardColor,
              contentPadding: const EdgeInsets.all(20)),
        )
      ],
    );
  }
}
