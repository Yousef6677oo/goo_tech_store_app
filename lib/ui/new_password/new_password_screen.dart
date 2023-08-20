import 'package:flutter/material.dart';

import '../../components/custom_auth_text_field.dart';
import '../../components/custom_back_arrow_icon.dart';
import '../../components/custom_button_screen_name.dart';
import '../../utilities/validation_utils.dart';

class NewPasswordScreen extends StatelessWidget {
  static const String routeName = "new_password_screen";
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
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
                "New Password",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).secondaryHeaderColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.2),
              CustomAuthTextFiled(
                  labelText: 'Password',
                  controller: passwordController,
                  validator: validatePasswordTextField),
              SizedBox(height: height * 0.03),
              CustomAuthTextFiled(
                  labelText: 'Confirm Password',
                  controller: confirmPasswordController,
                  validator: validatePasswordTextField),
              SizedBox(height: height * 0.25),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                child: const Text(
                  "Please write your new password.",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8F959E)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: height * 0.03)
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
          onTap: () {
            resetPassword();
          },
          child: CustomButtonScreenName(
            screenName: "Reset Password",
          )),
    );
  }

  void resetPassword() {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
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
