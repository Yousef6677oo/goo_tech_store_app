import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/custom_auth_text_field.dart';
import '../../components/custom_back_arrow_icon.dart';
import '../../components/custom_button_screen_name.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/validation_utils.dart';
import '../forgot_password/forgot_password_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "sign_in_screen";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isOnSwitch = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
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
              "Welcome",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).secondaryHeaderColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.005),
            const Text(
              "Please enter your data to continue",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8F959E)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.12),
            CustomAuthTextFiled(
                labelText: 'Username',
                controller: userNameController,
                validator: validateUserNameTextField),
            SizedBox(height: height * 0.03),
            CustomAuthTextFiled(
                labelText: 'Password',
                controller: passwordController,
                validator: validatePasswordTextField),
            SizedBox(height: height * 0.035),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                },
                child: const Text("Forgot password?",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffEA4335)),
                    textAlign: TextAlign.end),
              ),
            ),
            SizedBox(height: height * 0.035),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Text(
                    "Remember me",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                ),
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
            const Spacer(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.01),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      style: TextStyle(color: Colors.blue), //apply style to all
                      children: [
                        TextSpan(
                          text:
                              'By connecting your account confirm that you agree with our',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8F959E)),
                        ),
                        TextSpan(
                          text: ' Term and Condition',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1D1E20)),
                        ),
                      ])),
            ),
            SizedBox(height: height * 0.03)
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
          onTap: () {
            signIn();
          },
          child: CustomButtonScreenName(screenName: "Login")),
    );
  }

  void signIn() {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
  }

  String? validateUserNameTextField(String value) {
    if (ValidationUtils.isValidateUsername(value) == true) {
      return 'Please a username';
    }
    if (value.length < 6) {
      return 'Please a Enter Valid username';
    }
    return null;
  }

  String? validatePasswordTextField(String value) {
    if (ValidationUtils.isValidatePassword(value!) == true) {
      return 'Please a Enter Password';
    }
    if (value.length < 6) {
      return 'password should be at least 6 characters';
    }
    return null;
  }
}
