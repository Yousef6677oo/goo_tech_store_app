import 'package:e_commerce_app/data/firebase_manager.dart';
import 'package:e_commerce_app/data/hive_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../provider/theme_provider.dart';
import '../ui/authentication_way/authentication_way_screen.dart';
import '../ui/home/home_screen.dart';
import '../utilities/app_colors.dart';

//todo: error here
class customSideMenu extends StatefulWidget {
  @override
  State<customSideMenu> createState() => _customSideMenuState();
}

class _customSideMenuState extends State<customSideMenu> {
  late bool isDarkMode;
  late String userName;

  @override
  void initState() {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    isDarkMode = brightness == Brightness.dark;
    userName = HiveManager.myBox?.get("username");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ThemeProvider provider = BlocProvider.of<ThemeProvider>(context);
    return Drawer(
      child: BlocBuilder<ThemeProvider, CurrentTheme>(
        bloc: provider,
        buildWhen: (previous, current) {
          return true;
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.09),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SvgPicture.asset("assets/Images/side_menu_icon.svg",
                      width: width * 0.1,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).secondaryHeaderColor,
                          BlendMode.srcIn)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                        child: Text(
                          userName,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).hintColor),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        children: [
                          SizedBox(width: width * 0.02),
                          const Text(
                            "Verified Profile",
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
                        borderRadius: BorderRadius.circular(5)),
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
                  SvgPicture.asset("assets/Images/side_menu_dark_mode_icon.svg",
                      width: width * 0.1,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).hintColor, BlendMode.srcIn)),
                  SizedBox(width: width * 0.07),
                  Text("Dark Mode",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter-VariableFont',
                        color: Theme.of(context).hintColor,
                      )),
                  SizedBox(width: width * 0.035),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                    child: CupertinoSwitch(
                        activeColor: AppColors.switchActiveColor,
                        value: isDarkMode,
                        onChanged: (currentValue) {
                          if (isDarkMode) {
                            provider.convertToLightMode();
                          } else {
                            provider.convertToDarkMode();
                          }
                          setState(() {
                            isDarkMode = currentValue;
                          });
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
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).hintColor, BlendMode.srcIn)),
                  SizedBox(width: width * 0.07),
                  Text(
                    "Account Information",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter-VariableFont',
                      color: Theme.of(context).hintColor,
                    ),
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
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).hintColor, BlendMode.srcIn)),
                  SizedBox(width: width * 0.07),
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter-VariableFont',
                      color: Theme.of(context).hintColor,
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 0.03),
              GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, HomeScreen.routeName,
                      arguments: 2);
                },
                child: Row(
                  children: [
                    SizedBox(width: width * 0.04),
                    SvgPicture.asset(
                        "assets/Images/side_menu_bag_order_icon.svg",
                        width: width * 0.1,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).hintColor, BlendMode.srcIn)),
                    SizedBox(width: width * 0.07),
                    Text(
                      "Order",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter-VariableFont',
                        color: Theme.of(context).hintColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
              GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, HomeScreen.routeName,
                      arguments: 3);
                },
                child: Row(
                  children: [
                    SizedBox(width: width * 0.04),
                    SvgPicture.asset(
                        "assets/Images/side_menu_wallet_my_cards_icon.svg",
                        width: width * 0.1,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).hintColor, BlendMode.srcIn)),
                    SizedBox(width: width * 0.07),
                    Text(
                      "My Cards",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter-VariableFont',
                        color: Theme.of(context).hintColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
              GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, HomeScreen.routeName,
                      arguments: 1);
                },
                child: Row(
                  children: [
                    SizedBox(width: width * 0.04),
                    SvgPicture.asset(
                        "assets/Images/side_menu_heart_wishlist_icon.svg",
                        width: width * 0.1,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).hintColor, BlendMode.srcIn)),
                    SizedBox(width: width * 0.07),
                    Text(
                      "Wishlist",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter-VariableFont',
                        color: Theme.of(context).hintColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
              Row(
                children: [
                  SizedBox(width: width * 0.04),
                  SvgPicture.asset("assets/Images/side_menu_settings_icon.svg",
                      width: width * 0.1,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).hintColor, BlendMode.srcIn)),
                  SizedBox(width: width * 0.07),
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter-VariableFont',
                      color: Theme.of(context).hintColor,
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 0.1),
              InkWell(
                onTap: () async {
                  await HiveManager.deleteAllBoxes();
                  await FirebaseManager.logOut().then((value) =>
                      Navigator.pushNamedAndRemoveUntil(context,
                          AuthenticationWayScreen.routeName, (route) => false));
                },
                child: Row(
                  children: [
                    SizedBox(width: width * 0.05),
                    SvgPicture.asset(
                      "assets/Images/side_menu_log_out_icon.svg",
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).hintColor, BlendMode.srcIn),
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
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
