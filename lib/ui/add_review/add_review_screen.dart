import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custom_button_screen_name.dart';
import '../../components/custom_textField.dart';

class AddReviewScreen extends StatefulWidget {
  static const String routeName = 'add_review_screen';

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController nameController = TextEditingController();
    TextEditingController experienceController = TextEditingController();
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
                  padding: EdgeInsets.symmetric(horizontal: width * 0.21),
                  child: Text(
                    "Add Review",
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
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: CustomTextField(
                labelText: 'Name',
                hintText: 'Type your name',
                controller: nameController,
                maxLines: 1,
              ),
            ),
            SizedBox(height: height * 0.025),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: CustomTextField(
                labelText: 'How was your experience ?',
                hintText: 'Describe your experience?',
                controller: experienceController,
                maxLines: 8,
              ),
            ),
            SizedBox(height: height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Text(
                "Star",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).secondaryHeaderColor),
              ),
            ),
            Row(
              children: [
                SizedBox(width: width * 0.06),
                Text(
                  rating.toStringAsFixed(1),
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).secondaryHeaderColor),
                ),
                Expanded(
                  child: Slider(
                    activeColor: Theme.of(context).cardColor,
                    inactiveColor: Theme.of(context).cardColor,
                    thumbColor: const Color(0xff9775FA),
                    value: rating,
                    onChanged: (newRating) {
                      setState(() => rating = newRating);
                    },
                    min: 0,
                    max: 5,
                  ),
                ),
                Text(
                  "5.0",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).secondaryHeaderColor),
                ),
                SizedBox(width: width * 0.05),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonScreenName(screenName: 'Submit Review'),
    );
  }
}
