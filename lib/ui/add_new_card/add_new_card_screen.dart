import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custom_button_screen_name.dart';
import '../../components/custom_textField.dart';

class AddNewCardScreen extends StatelessWidget {
  static const String routeName = "add_new_card_screen";
  TextEditingController cardOwnerController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: height * 0.09),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.04),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          "assets/Images/arrow_left.svg",
                          height: height * 0.05,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.19),
                  child: Text(
                    "Add New Card",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).hintColor),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: width * 0.28,
                    height: height * 0.08,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFEEE3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffFF5F00))),
                    child: Image.asset(
                      "assets/Images/visa_icon.png",
                      scale: 0.85,
                    )),
                Container(
                    width: width * 0.28,
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/Images/paypal_icon.png",
                      scale: 0.85,
                    )),
                Container(
                    width: width * 0.28,
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/Images/bank_icon.png",
                      color: Theme.of(context).hintColor,
                      scale: 0.85,
                    )),
              ],
            ),
            SizedBox(height: height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: CustomTextField(
                  labelText: 'Card Owner',
                  hintText: 'Mrh Raju',
                  controller: cardOwnerController,
                  maxLines: 1),
            ),
            SizedBox(height: height * 0.025),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: CustomTextField(
                  labelText: 'Card Number',
                  hintText: '5254 7634 8734 7690',
                  controller: cardNumberController,
                  maxLines: 1),
            ),
            SizedBox(height: height * 0.025),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: width * 0.04),
                  child: CustomTextField(
                      labelText: 'EXP',
                      hintText: '24/24',
                      controller: expController,
                      maxLines: 1),
                )),
                SizedBox(width: width * 0.05),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(right: width * 0.04),
                  child: CustomTextField(
                      labelText: 'CVV',
                      hintText: '7763',
                      controller: cvvController,
                      maxLines: 1),
                )),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonScreenName(
        screenName: 'Add Card',
      ),
    );
  }
}
