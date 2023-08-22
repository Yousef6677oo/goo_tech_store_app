import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custom_button_screen_name.dart';
import '../../model/new_arraival_DM.dart';
import '../home/home_screen.dart';

class NewArrivalDetailsScreen extends StatelessWidget {
  static const String routeName = "new_arrival_details_screen";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as NewArrivalDM;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: height * 0.037),
            Stack(
              children: [
                Image.asset("assets/Images/new_arraival_main_image_1.png",
                    width: width, height: height * 0.5, fit: BoxFit.fill),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: width * 0.035),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xffFEFEFE),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                                "assets/Images/arrow_left.svg",
                                height: height * 0.06),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, HomeScreen.routeName,
                              arguments: 2);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: width * 0.035),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xffFEFEFE),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              "assets/Images/bag_icon.svg",
                              width: width * 0.11,
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Text(
                    args.subCategory!,
                    style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter-VariableFont',
                        color: Color(0xff8F959E)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                  child: const Text(
                    "Price",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter-VariableFont',
                        color: Color(0xff8F959E)),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Text(
                    args.category!,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter-VariableFont',
                        color: Theme.of(context).hintColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Text(
                    r"$" "${args.price?.toStringAsFixed(0)}",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter-VariableFont',
                        color: Theme.of(context).hintColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: args.listOfImages?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .backgroundColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.01),
                                child: Image.asset(
                                  args.listOfImages![index],
                                  width: width * 0.21,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Text(
                    "Size",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter-VariableFont',
                        color: Theme.of(context).hintColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: const Text(
                    "Size Guide",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter-VariableFont',
                        color: Color(0xff8F959E)),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.015),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: args.listOfSize?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              width: width * 0.165,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child:
                                  Center(child: Text(args.listOfSize![index])));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: width * 0.02);
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
              child: Text(
                "Description",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter-VariableFont',
                    color: Theme.of(context).hintColor),
              ),
            ),
            SizedBox(height: height * 0.015),
            Padding(
              padding: EdgeInsets.only(left: width * 0.06),
              child: Text(
                args.description!,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Inter-VariableFont',
                    color: Color(0xff8F959E)),
              ),
            ),
            SizedBox(height: height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Text(
                    "Reviews",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter-VariableFont',
                        color: Theme.of(context).hintColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: const Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter-VariableFont',
                        color: Color(0xff8F959E)),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.15),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonScreenName(
        screenName: 'Add to Cart',
      ),
    );
  }
}
