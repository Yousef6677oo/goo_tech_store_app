import 'package:e_commerce_app/ui/home/home_screen.dart';
import 'package:e_commerce_app/ui/sign_in/sign_in_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/custom_auth_text_field.dart';
import '../../components/custom_back_arrow_icon.dart';
import '../../components/custom_button_screen_name.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/dialog_utils.dart';
import '../../utilities/validation_utils.dart';
import '../forgot_password/forgot_password_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "sign_in_screen";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isOnSwitch = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var viewModel = SignInViewModel();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<SignInViewModel, SignInViewState>(
      bloc: viewModel,
      listenWhen: (previous, current) {
        if (previous is LoadingState) {
          DialogUtils.hideDialog(context);
        }
        if (current is SuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.routeName, (route) => false);
        }
        if (current is LoadingState ||
            current is SuccessState ||
            current is ErrorState) {
          return true;
        }
        return false;
      },
      buildWhen: (previous, current) {
        if (current is InitState) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is LoadingState) {
          DialogUtils.loadingDialog(context);
        }
        if (state is ErrorState) {
          DialogUtils.showMessageDialog(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.09),
                  Container(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
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
                      labelText: 'email',
                      controller: emailAddressController,
                      validator: validateEmailTextField),
                  SizedBox(height: height * 0.03),
                  CustomAuthTextFiled(
                      labelText: 'Password',
                      controller: passwordController,
                      validator: validatePasswordTextField),
                  SizedBox(height: height * 0.035),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, ForgotPasswordScreen.routeName);
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
                  SizedBox(height: height * 0.12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: const TextStyle(color: Colors.blue),
                            //apply style to all
                            children: [
                              const TextSpan(
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
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                              ),
                            ])),
                  ),
                  SizedBox(height: height * 0.03)
                ],
              ),
            ),
          ),
          bottomNavigationBar: GestureDetector(
              onTap: () {
                signIn();
              },
              child: CustomButtonScreenName(screenName: "Login")),
        );
      },
    );
  }

  Future<void> signIn() async {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    await viewModel.signIn(emailAddressController.text.trim(),
        passwordController.text.trim(), isOnSwitch);
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
