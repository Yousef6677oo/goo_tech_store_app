import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custom_button_screen_name.dart';
import '../home/home_screen.dart';

class OrderConfirmedScreen extends StatelessWidget {
  static const String routeName = 'order_confirmed_screen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(isDarkMode
                    ? "assets/Images/dark_order_confirmed_background.png"
                    : "assets/Images/light_order_confirmed_background.jpg"),
                fit: BoxFit.cover)),
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
              ],
            ),
            SizedBox(height: height * 0.42),
            Text("Order Confirmed!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).hintColor),
                textAlign: TextAlign.center),
            SizedBox(height: height * 0.015),
            const Text("Your order has been confirmed, we will send",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter-VariableFont',
                    color: Color(0xff8F959E)),
                textAlign: TextAlign.center),
            SizedBox(height: height * 0.007),
            const Text("you confirmation email shortly.",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter-VariableFont',
                    color: Color(0xff8F959E)),
                textAlign: TextAlign.center),
            SizedBox(height: height * 0.095),
            GestureDetector(
              onTap: () {
                Navigator.popAndPushNamed(context, HomeScreen.routeName,
                    arguments: 2);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Container(
                  height: height * 0.08,
                  decoration: BoxDecoration(
                      color: isDarkMode
                          ? const Color(0xff222E34)
                          : const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    "Go to Orders",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8F959E)),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonScreenName(
        screenName: 'Continue Shopping',
      ),
    );
  }
}
