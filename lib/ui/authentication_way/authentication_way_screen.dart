import 'package:e_commerce_app/ui/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/custom_back_arrow_icon.dart';
import '../../components/custom_button_screen_name.dart';
import '../../components/custom_social_media_auth_widget.dart';
import '../sign_in/sign_in_screen.dart';
import 'authentication_way_view_model.dart';

class AuthenticationWayScreen extends StatelessWidget {
  static const routeName = 'authentication_way_screen';
  late AuthenticationWayViewModel viewMode;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    viewMode = AuthenticationWayViewModel();
    return BlocConsumer<AuthenticationWayViewModel, AuthenticationWayViewState>(
      bloc: viewMode,
      listenWhen: (previous, current) {
        return true;
      },
      listener: (context, state) {},
      buildWhen: (previous, current) {
        return true;
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
              InkWell(
                onTap: () {
                  signInWithFacebook();
                },
                child: CustomSocialMediaAuthWidget(
                  name: 'Facebook',
                  color: const Color(0xff4267B2),
                  pathIcon: 'assets/Images/facebook_icon.svg',
                ),
              ),
              SizedBox(height: height * 0.018),
              InkWell(
                onTap: () {
                  signInWithTwitter();
                },
                child: CustomSocialMediaAuthWidget(
                  name: 'Twitter',
                  color: const Color(0xff1DA1F2),
                  pathIcon: 'assets/Images/twitter_icon.svg',
                ),
              ),
              SizedBox(height: height * 0.018),
              InkWell(
                onTap: () {
                  signInWithGoogle();
                },
                child: CustomSocialMediaAuthWidget(
                  name: 'Google',
                  color: const Color(0xffEA4335),
                  pathIcon: 'assets/Images/google_icon.svg',
                ),
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
      },
    );
  }

  signInWithFacebook() async {
    await viewMode.signInWithFacebook();
  }

  signInWithTwitter() async {
    // await viewMode.signInWithTwitter();
  }

  signInWithGoogle() async {
    // await viewMode.signInWithGoogle();
  }
}
