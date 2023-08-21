import 'package:e_commerce_app/ui/home/home_screen.dart';
import 'package:e_commerce_app/ui/sign_up/sign_up_view_model.dart';
import 'package:e_commerce_app/utilities/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/custom_auth_text_field.dart';
import '../../components/custom_back_arrow_icon.dart';
import '../../components/custom_button_screen_name.dart';
import '../../utilities/dialog_utils.dart';
import '../../utilities/validation_utils.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "sign_up_screen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isOnSwitch = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  var viewModel = SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<SignUpViewModel, SignUpViewState>(
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
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).secondaryHeaderColor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.15),
                  CustomAuthTextFiled(
                    labelText: 'Username',
                    controller: userNameController,
                    validator: validatePasswordTextField,
                  ),
                  SizedBox(height: height * 0.03),
                  CustomAuthTextFiled(
                    labelText: 'Password',
                    controller: passwordController,
                    validator: validateUserNameTextField,
                  ),
                  SizedBox(height: height * 0.03),
                  CustomAuthTextFiled(
                    labelText: 'Email Address',
                    controller: emailAddressController,
                    validator: validateEmailTextField,
                  ),
                  SizedBox(height: height * 0.045),
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
                ],
              ),
            ),
          ),
          bottomNavigationBar: GestureDetector(
              onTap: () {
                signUp();
              },
              child: CustomButtonScreenName(screenName: "Sign Up")),
        );
      },
    );
  }

  Future<void> signUp() async {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    await viewModel.signUp(userNameController.text, emailAddressController.text,
        passwordController.text);
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
