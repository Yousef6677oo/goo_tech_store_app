import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custom_button_screen_name.dart';
import '../../components/custom_textField.dart';

class PaymentScreen extends StatefulWidget {
  static const String routeName = "payment_screen";

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController cardOwnerController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();

  TextEditingController expController = TextEditingController();

  TextEditingController cvvController = TextEditingController();

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<String> listPaymentCards = [
      "assets/Images/card_1_icon.png",
      "assets/Images/card_2_icon.png"
    ];
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
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
                  padding: EdgeInsets.symmetric(horizontal: width * 0.25),
                  child: Text(
                    "Payment",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).hintColor),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: SizedBox(
                height: height * 0.23,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            listPaymentCards[index],
                            width: width * 0.82,
                            fit: BoxFit.fill,
                          );
                        },
                        itemCount: listPaymentCards.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: width * 0.05);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.025),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Container(
                width: width,
                height: height * 0.07,
                decoration: BoxDecoration(
                    color: isDarkMode
                        ? const Color(0xff2F244E)
                        : const Color(0xffF6F2FF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xff9775FA))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/Images/add_icon.svg",
                        width: width * 0.06),
                    SizedBox(width: width * 0.03),
                    const Text(
                      "Add new card",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff9775FA)),
                    )
                  ],
                ),
              ),
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
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Text("Save as primary address",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter-VariableFont',
                          color: Theme.of(context).secondaryHeaderColor)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: CupertinoSwitch(
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonScreenName(
        screenName: 'Save Card',
      ),
    );
  }
}
