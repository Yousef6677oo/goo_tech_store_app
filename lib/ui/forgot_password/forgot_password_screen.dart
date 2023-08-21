import 'package:e_commerce_app/components/custom_button_screen_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custom_auth_text_field.dart';
import '../../components/custom_back_arrow_icon.dart';
import '../../utilities/dialog_utils.dart';
import '../../utilities/validation_utils.dart';
import 'forgot_password_view_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = "forgot_password_screen";

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailAddressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var viewModel = ForgotPasswordViewModel();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<ForgotPasswordViewModel, ForgotPasswordViewState>(
      bloc: viewModel,
      listenWhen: (previous, current) {
        if (previous is LoadingState) {
          DialogUtils.hideDialog(context);
        }
        if (current is SuccessState) {
          Navigator.pop(context);
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
      },
    );
  }

  Future<void> confirmEmail() async {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    await viewModel.sendPasswordResetEmail(emailAddressController.text);
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
