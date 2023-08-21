import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utilities/app_colors.dart';

class customSideMenu extends StatefulWidget {
  @override
  State<customSideMenu> createState() => _customSideMenuState();
}

class _customSideMenuState extends State<customSideMenu> {
  bool isOnSwitch = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.09),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SvgPicture.asset(
                "assets/Images/side_menu_icon.svg",
                width: width * 0.1,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
          SizedBox(height: height * 0.03),
          Row(
            children: [
              SizedBox(width: width * 0.02),
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: height * 0.04,
              ),
              Column(
                children: [
                  Text(
                    "Yousef Ahmed",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).hintColor),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      SizedBox(width: width * 0.02),
                      const Text(
                        " Verified Profile",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.labelColor),
                      ),
                      SvgPicture.asset(
                        "assets/Images/verified_icon.svg",
                        height: height * 0.04,
                      )
                    ],
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.02, horizontal: 5),
                  child: const Text(
                    "0 Orders",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.labelColor),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: height * 0.05),
          Row(
            children: [
              SizedBox(width: width * 0.04),
              SvgPicture.asset(
                "assets/Images/side_menu_dark_mode_icon.svg",
                width: width * 0.1,
              ),
              SizedBox(width: width * 0.07),
              const Text("Dark Mode",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter-VariableFont')),
              SizedBox(width: width * 0.035),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: CupertinoSwitch(
                    activeColor: AppColors.switchActiveColor,
                    value: isOnSwitch,
                    onChanged: (currentValue) {
                      isOnSwitch = currentValue;
                      setState(() {});
                    }),
              )
            ],
          ),
          SizedBox(height: height * 0.03),
          Row(
            children: [
              SizedBox(width: width * 0.04),
              SvgPicture.asset(
                "assets/Images/side_menu_account_information_icon.svg",
                width: width * 0.1,
              ),
              SizedBox(width: width * 0.07),
              const Text(
                "Account Information",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter-VariableFont'),
              )
            ],
          ),
          SizedBox(height: height * 0.03),
          Row(
            children: [
              SizedBox(width: width * 0.04),
              SvgPicture.asset(
                "assets/Images/side_menu_lock_password_icon.svg",
                width: width * 0.1,
              ),
              SizedBox(width: width * 0.07),
              const Text(
                "Password",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter-VariableFont'),
              )
            ],
          ),
          SizedBox(height: height * 0.03),
          Row(
            children: [
              SizedBox(width: width * 0.04),
              SvgPicture.asset(
                "assets/Images/side_menu_bag_order_icon.svg",
                width: width * 0.1,
              ),
              SizedBox(width: width * 0.07),
              const Text(
                "Order",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter-VariableFont'),
              )
            ],
          ),
          SizedBox(height: height * 0.03),
          Row(
            children: [
              SizedBox(width: width * 0.04),
              SvgPicture.asset(
                "assets/Images/side_menu_wallet_my_cards_icon.svg",
                width: width * 0.1,
              ),
              SizedBox(width: width * 0.07),
              const Text(
                "My Cards",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter-VariableFont'),
              )
            ],
          ),
          SizedBox(height: height * 0.03),
          Row(
            children: [
              SizedBox(width: width * 0.04),
              SvgPicture.asset(
                "assets/Images/side_menu_heart_wishlist_icon.svg",
                width: width * 0.1,
              ),
              SizedBox(width: width * 0.07),
              const Text(
                "Wishlist",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter-VariableFont'),
              )
            ],
          ),
          SizedBox(height: height * 0.03),
          Row(
            children: [
              SizedBox(width: width * 0.04),
              SvgPicture.asset(
                "assets/Images/side_menu_settings_icon.svg",
                width: width * 0.1,
              ),
              SizedBox(width: width * 0.07),
              const Text(
                "Settings",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter-VariableFont'),
              )
            ],
          ),
          SizedBox(height: height * 0.1),
          Row(
            children: [
              SizedBox(width: width * 0.05),
              SvgPicture.asset(
                "assets/Images/side_menu_log_out_icon.svg",
                width: width * 0.1,
              ),
              SizedBox(width: width * 0.07),
              const Text(
                "Logout",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter-VariableFont',
                    color: Color(0xffFF5757)),
              )
            ],
          )
        ],
      ),
    );
  }
}
