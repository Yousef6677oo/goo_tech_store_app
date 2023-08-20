import 'package:e_commerce_app/components/custom_button_screen_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custom_auth_text_field.dart';
import '../../components/custom_back_arrow_icon.dart';
import '../../utilities/validation_utils.dart';
import '../verification_code/verification_code_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = "forgot_password_screen";

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailAddressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                "Forgot Password",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).secondaryHeaderColor),
                textAlign: TextAlign.center,
              ),
              SvgPicture.asset("assets/Images/move_cloud_icon.svg"),
              SizedBox(height: height * 0.03),
              CustomAuthTextFiled(
                  labelText: 'Email Address',
                  controller: emailAddressController,
                  validator: validateEmailTextField),
              SizedBox(height: height * 0.2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                child: const Text(
                  "Please write your email to receive a confirmation code to set a new password.",
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
            confirmEmail();
          },
          child: CustomButtonScreenName(
            screenName: "Confirm Mail",
          )),
    );
  }

  void confirmEmail() {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    Navigator.pushNamed(context, VerificationCodeScreen.routeName);
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
