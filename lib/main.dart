import 'package:e_commerce_app/provider/theme_provider.dart';
import 'package:e_commerce_app/ui/choose_way_to_authenticate/choose_way_to_authenticate_screen.dart';
import 'package:e_commerce_app/ui/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce_app/ui/home/home_screen.dart';
import 'package:e_commerce_app/ui/select_type_gender/select_type_gender_screen.dart';
import 'package:e_commerce_app/ui/sign_in/sign_in_screen.dart';
import 'package:e_commerce_app/ui/sign_up/sign_up_screen.dart';
import 'package:e_commerce_app/ui/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce-App',
      theme: ThemeProvider.currentTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        SelectTypeGenderScreen.routeName: (_) => SelectTypeGenderScreen(),
        ChooseWayToAuthenticateScreen.routeName: (_) =>
            ChooseWayToAuthenticateScreen(),
        SignInScreen.routeName: (_) => SignInScreen(),
        SignUpScreen.routeName: (_) => SignUpScreen(),
        ForgotPasswordScreen.routeName: (_) => ForgotPasswordScreen(),
        HomeScreen.routeName: (_) => HomeScreen()
      },
    );
  }
}
