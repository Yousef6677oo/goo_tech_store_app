import 'package:flutter/material.dart';

import '../../../../utilities/app_colors.dart';

class HomeTab extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Text(
            "Hello",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter-VariableFont',
                color: Theme.of(context).secondaryHeaderColor),
          ),
        ),
        SizedBox(height: height * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: const Text(
            "Welcome to Store",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter-VariableFont',
                color: AppColors.labelColor),
          ),
        )
      ],
    );
  }
}
