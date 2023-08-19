import 'package:e_commerce_app/utilities/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/custom_auth_text_field.dart';
import '../../components/custom_back_arrow_icon.dart';
import '../../components/custom_button_screen_name.dart';
import '../../utilities/validation_utils.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "sign_up_screen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isOnSwitch = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: height * 0.09),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CustomBackArrowIcon()),
              ),
            ),
            SizedBox(height: height * 0.05),
            Expanded(
              flex: 3,
              child: Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).secondaryHeaderColor),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
                flex: 2,
                child: CustomAuthTextFiled(
                  labelText: 'Username',
                  controller: userNameController,
                  validator: validatePasswordTextField,
                )),
            Expanded(
                flex: 2,
                child: CustomAuthTextFiled(
                  labelText: 'Password',
                  controller: passwordController,
                  validator: validateUserNameTextField,
                )),
            Expanded(
                flex: 2,
                child: CustomAuthTextFiled(
                  labelText: 'Email Address',
                  controller: emailAddressController,
                  validator: validateEmailTextField,
                )),
            Expanded(
                child: Row(
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
            )),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
          onTap: () {
            signIn();
          },
          child: CustomButtonScreenName(screenName: "Sign Up")),
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

  String? validateEmailTextField(String value) {
    if (value!.isEmpty) {
      return 'Please a Enter Email';
    }
    if (ValidationUtils.isValidateEmail(value) == true) {
      return 'Please a Enter Valid Email';
    }
    return null;
  }
}
