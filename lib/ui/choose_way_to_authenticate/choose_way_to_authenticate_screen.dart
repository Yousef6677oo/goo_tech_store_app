import 'package:e_commerce_app/ui/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../components/custom_back_arrow_icon.dart';
import '../../components/custom_button_screen_name.dart';
import '../../components/custom_social_media_auth_widget.dart';
import '../sign_in/sign_in_screen.dart';

class ChooseWayToAuthenticateScreen extends StatelessWidget {
  static const routeName = 'create_an_account_screen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: height * 0.09),
          Container(
            alignment: Alignment.topLeft,
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CustomBackArrowIcon()),
          ),
          SizedBox(height: height * 0.05),
          Text(
            "Let’s Get Started",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).secondaryHeaderColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.16),
          CustomSocialMediaAuthWidget(
            name: 'Facebook',
            color: const Color(0xff4267B2),
            pathIcon: 'assets/Images/facebook_icon.svg',
          ),
          SizedBox(height: height * 0.018),
          CustomSocialMediaAuthWidget(
            name: 'Twitter',
            color: const Color(0xff1DA1F2),
            pathIcon: 'assets/Images/twitter_icon.svg',
          ),
          SizedBox(height: height * 0.018),
          CustomSocialMediaAuthWidget(
            name: 'Google ',
            color: const Color(0xffEA4335),
            pathIcon: 'assets/Images/google_icon.svg',
          ),
          const Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Already have an account? ",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8F959E)),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, SignInScreen.routeName);
              },
              child: Text(
                "Signin",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).hintColor),
              ),
            ),
          ]),
          SizedBox(height: height * 0.025),
        ],
      ),
      bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.pushNamed(context, SignUpScreen.routeName);
          },
          child: CustomButtonScreenName(screenName: "Create an Account")),
    );
  }
}
