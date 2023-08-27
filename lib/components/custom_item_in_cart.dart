import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_increment_decrement_button.dart';

class CustomItemInCart extends StatelessWidget {
  String imagePath;
  String category;
  String subCategory;
  String price;

  CustomItemInCart(
      {required this.category,
      required this.subCategory,
      required this.imagePath,
      required this.price});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: width * 0.9,
          height: height * 0.17,
          decoration: BoxDecoration(
              color: isDarkMode
                  ? const Color(0xff222E34)
                  : const Color(0xffFEFEFE),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              SizedBox(width: width * 0.05),
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: isDarkMode
                              ? const Color(0xff29363D)
                              : const Color(0xffF5F6FA),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(imagePath, scale: 0.75)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.05,
                        top: height * 0.01,
                        bottom: height * 0.005),
                    child: Text(
                      category,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).hintColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.05, bottom: height * 0.012),
                    child: Text(
                      subCategory,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).hintColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      price,
                      style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Inter-VariableFont',
                          color: Color(0xff8F959E)),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    children: [
                      SizedBox(width: width * 0.05),
                      CustomIncrementDecrementButton(
                          "assets/Images/arrow_down_icon.svg"),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Text(
                          "1",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).secondaryHeaderColor),
                        ),
                      ),
                      CustomIncrementDecrementButton(
                          "assets/Images/arrow_up_icon.svg"),
                      SizedBox(width: width * 0.1),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(17.5),
                          border: Border.all(
                              color: const Color(0xffDEDEDE), width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child:
                              SvgPicture.asset("assets/Images/delete_icon.svg"),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
