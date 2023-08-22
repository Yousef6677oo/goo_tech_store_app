import 'package:e_commerce_app/ui/home/tabs/cart/cart_tab.dart';
import 'package:e_commerce_app/ui/home/tabs/home/home_tab.dart';
import 'package:e_commerce_app/ui/home/tabs/wallet/wallet_tab.dart';
import 'package:e_commerce_app/ui/home/tabs/wishlist/wishlist_tab.dart';
import 'package:e_commerce_app/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custom_side_menu.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> tabs = [HomeTab(), WishlistTab(), CartTab(), WalletTab()];
  int currentIndex = 0;
  bool notNav = true;
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    var navIndex = ModalRoute.of(context)!.settings.arguments;
    if (navIndex != null && notNav) {
      currentIndex = int.parse("$navIndex");
      notNav = false;
    }
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      drawer: customSideMenu(),
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/Images/side_menu_icon.svg",
            width: width * 0.2,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.02),
            child: GestureDetector(
              onTap: () {
                currentIndex = 2;
                setState(() {});
              },
              child: SvgPicture.asset(
                "assets/Images/bag_icon.svg",
                width: width * 0.09,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          )
        ],
        toolbarHeight: height * 0.15,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              label: "Home",
              icon: buildBottomIcon(
                  0, "Home", "assets/Images/bottom_nav_bar_home_icon.svg")),
          BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              label: "Wishlist",
              icon: buildBottomIcon(1, "Wishlist",
                  "assets/Images/bottom_nav_bar_wishlist_icon.svg")),
          BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              label: "Cart",
              icon: buildBottomIcon(
                  2, "Cart", "assets/Images/bottom_nav_bar_cart_icon.svg")),
          BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              label: "Wallet",
              icon: buildBottomIcon(
                  3, "Wallet", "assets/Images/bottom_nav_bar_wallet_icon.svg")),
        ],
      ),
    );
  }

  Widget buildBottomIcon(double index, String label, String imagePath) {
    return index != currentIndex
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: SvgPicture.asset(imagePath,
                height: height * 0.032, color: AppColors.labelColor),
          )
        : Text(
            label,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xff9775FA)),
          );
  }
}
