import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../add_review/add_review_screen.dart';

class ViewAllReviewsScreen extends StatelessWidget {
  static const String routeName = "view_all_reviews_screen";

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
                    "Reviews",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).hintColor),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.05),
            Padding(
              padding: EdgeInsets.only(left: width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "245 Reviews",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).hintColor),
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        children: [
                          Text(
                            "4.8",
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor),
                          ),
                          SizedBox(width: width * 0.01),
                          Image.asset(
                            "assets/Images/stars_icon.png",
                            scale: 0.8,
                          )
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AddReviewScreen.routeName);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Container(
                        width: width * 0.38,
                        height: height * 0.055,
                        decoration: BoxDecoration(
                            color: isDarkMode
                                ? const Color(0xff9775FA)
                                : const Color(0xffFF7043),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            SizedBox(width: width * 0.025),
                            SvgPicture.asset(
                              "assets/Images/add_review_icon.svg",
                              width: width * 0.07,
                            ),
                            SizedBox(width: width * 0.03),
                            const Text(
                              "Add Review",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.002),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.04),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: width * 0.08,
                                      child: Image.asset(
                                        "assets/Images/reviews_man_${index + 1}.png",
                                        height: height * 0.2,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: height * 0.009),
                                      child: Text(
                                        "Ronald Richards",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context).hintColor),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/Images/clock_icon.svg"),
                                        SizedBox(width: width * 0.017),
                                        const Text(
                                          "13 Sep, 2020",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff8F959E)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: height * 0.009),
                                      child: Row(
                                        children: [
                                          Text(
                                            "4.8",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .secondaryHeaderColor),
                                          ),
                                          SizedBox(width: width * 0.018),
                                          const Text("rating",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xff8F959E)))
                                        ],
                                      ),
                                    ),
                                    Image.asset("assets/Images/stars_icon.png",
                                        scale: 0.7)
                                  ],
                                ),
                                SizedBox(width: width * 0.05),
                              ],
                            ),
                            //todo: Details of Reviews
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.04, top: height * 0.015),
                              child: const Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff8F959E)),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: 4,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: height * 0.02);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
