import 'package:e_commerce_app/ui/address/address_screen.dart';
import 'package:e_commerce_app/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../components/custom_button_screen_name.dart';
import '../../../../components/custom_item_in_cart.dart';
import '../../../../components/custom_order_info.dart';
import '../../../payment/payment_screen.dart';

class CartTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
            CustomItemInCart(
              category: "Men's Tie-Dye T-Shirt",
              subCategory: "Nike Sportswear",
              imagePath: "assets/Images/cart_man_1.png",
              price: r"$45 (-$4.00 Tax)",
            ),
            CustomItemInCart(
              category: "Men's Tie-Dye T-Shirt",
              subCategory: "Nike Sportswear",
              imagePath: "assets/Images/cart_man_2.png",
              price: r"$45 (-$4.00 Tax)",
            ),
            SizedBox(height: height * 0.02),
            Column(
              children: [
                Row(
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AddressScreen.routeName);
                        },
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Theme.of(context).hintColor,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: height * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: width * 0.04),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          "assets/Images/map_icon.png",
                          width: width * 0.21,
                          height: height * 0.093,
                          fit: BoxFit.fill,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: isDarkMode
                                  ? const Color(0xff9775FA)
                                  : const Color(0xffFF7043),
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 6.0, left: 1, right: 1),
                            child: SvgPicture.asset(
                                "assets/Images/location_icon.svg",
                                width: width * 0.09),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: width * 0.02),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.017),
                            child: Text(
                              "Chhatak, Sunamgonj 12/8AB",
                              style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                          ),
                          const Text(
                            "Sylhet",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Inter-VariableFont',
                                color: Color(0xff8F959E)),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.02),
                            child: SvgPicture.asset(
                              "assets/Images/check_icon.svg",
                              height: height * 0.035,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: height * 0.02),
            Column(
              children: [
                Row(
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, PaymentScreen.routeName);
                        },
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Theme.of(context).hintColor,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: height * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: width * 0.04),
                    Column(
                      children: [
                        Container(
                          width: width * 0.21,
                          height: height * 0.093,
                          decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:
                                SvgPicture.asset("assets/Images/visa_icon.svg"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: width * 0.02),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.017),
                            child: Text(
                              "Visa Classic",
                              style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                          ),
                          const Text(
                            "**** 7690",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Inter-VariableFont',
                                color: Color(0xff8F959E)),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.02),
                            child: SvgPicture.asset(
                              "assets/Images/check_icon.svg",
                              height: height * 0.035,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: height * 0.03),
            CustomOrderInfo(
              subTotal: r"$110",
              shippingCost: r"$10",
              total: r"$120",
            ),
            SizedBox(height: height * 0.03),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonScreenName(
        screenName: 'Checkout',
      ),
    );
  }
}
