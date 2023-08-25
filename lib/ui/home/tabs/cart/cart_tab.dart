import 'package:e_commerce_app/ui/address/address_screen.dart';
import 'package:e_commerce_app/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../components/custom_button_screen_name.dart';
import '../../../payment/payment_screen.dart';

class CartTab extends StatelessWidget {
  static const String routeName = "cart_tab";

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
                      Navigator.pushNamed(context, HomeScreen.routeName,
                          arguments: 0);
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
                  padding: EdgeInsets.symmetric(horizontal: width * 0.295),
                  child: Text(
                    "Cart",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).hintColor),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.02),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AddressScreen.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      "Delivery Address",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).hintColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.05),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).hintColor,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.1),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PaymentScreen.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      "Payment Method",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).hintColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.05),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).hintColor,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.3),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Text(
                "Order Info",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).hintColor),
              ),
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: const Text(
                    "Subtotal",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter-VariableFont',
                        color: Color(0xff8F959E)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Text(
                    r"$110",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter-VariableFont',
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.012),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: const Text(
                    "Shipping cost",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter-VariableFont',
                        color: Color(0xff8F959E)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Text(
                    r"$10",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter-VariableFont',
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.012),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: const Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter-VariableFont',
                        color: Color(0xff8F959E)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Text(
                    r"$120",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter-VariableFont',
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonScreenName(
        screenName: 'Checkout',
      ),
    );
  }
}
