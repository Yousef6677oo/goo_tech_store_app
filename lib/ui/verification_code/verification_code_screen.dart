import 'package:e_commerce_app/components/custom_button_screen_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../components/custom_back_arrow_icon.dart';
import '../../provider/theme_provider.dart';
import '../new_password/new_password_screen.dart';

class VerificationCodeScreen extends StatefulWidget {
  static const String routeName = "verification_code_screen";

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _onEditing = true;
  String? _code;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ThemeProvider provider = BlocProvider.of<ThemeProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
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
              "Verification Code",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).secondaryHeaderColor),
              textAlign: TextAlign.center,
            ),
            SvgPicture.asset("assets/Images/move_cloud_icon.svg"),
            SizedBox(height: height * 0.03),
            Center(
              child: VerificationCode(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                textStyle:  TextStyle(fontSize: 35.0, fontWeight: FontWeight.w600,color: Theme.of(context).secondaryHeaderColor),
                keyboardType: TextInputType.number,
                fullBorder: true,
                itemSize: 75,
                length: 4,
                cursorColor: Colors.transparent, // If this is null it will default to the ambient
                onCompleted: (String value) {
                  setState(() {
                    _code = value;
                  });
                },
                onEditing: (bool value) {
                  setState(() {
                    _onEditing = value;
                  });
                  if (!_onEditing) FocusScope.of(context).unfocus();
                },
              ),
            ),
            SizedBox(height: height * 0.20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.01),
              child: const Text(
                "00:20 resend confirmation code.",
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
      bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.pushNamed(context, NewPasswordScreen.routeName);
          },
          child: CustomButtonScreenName(
            screenName: "Confirm Code",
          )),
    );
  }
}


