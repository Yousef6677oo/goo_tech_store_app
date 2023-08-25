import 'package:e_commerce_app/provider/theme_provider.dart';
import 'package:e_commerce_app/ui/add_new_card/add_new_card_screen.dart';
import 'package:e_commerce_app/ui/add_review/add_review_screen.dart';
import 'package:e_commerce_app/ui/address/address_screen.dart';
import 'package:e_commerce_app/ui/authentication_way/authentication_way_screen.dart';
import 'package:e_commerce_app/ui/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce_app/ui/home/home_screen.dart';
import 'package:e_commerce_app/ui/new_arrival_details/new_arrival_details_screen.dart';
import 'package:e_commerce_app/ui/order_confirmed/order_confirmed_screen.dart';
import 'package:e_commerce_app/ui/payment/payment_screen.dart';
import 'package:e_commerce_app/ui/select_type_gender/select_type_gender_screen.dart';
import 'package:e_commerce_app/ui/sign_in/sign_in_screen.dart';
import 'package:e_commerce_app/ui/sign_up/sign_up_screen.dart';
import 'package:e_commerce_app/ui/splash/splash_screen.dart';
import 'package:e_commerce_app/ui/view_all_reviews/view_all_reviews_screen.dart';
import 'package:e_commerce_app/utilities/app_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/hive_manager.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HiveManager.myBox = await HiveManager.initializeHiveBox("settings");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(BlocProvider(
      create: (BuildContext context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = BlocProvider.of<ThemeProvider>(context);
    return BlocBuilder<ThemeProvider, CurrentTheme>(
      bloc: provider,
      buildWhen: (previous, current) {
        return true;
      },
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-Commerce-App',
          themeMode: provider.currentTheme,
          darkTheme: AppThemes.darkTheme,
          theme: AppThemes.lightTheme,
          initialRoute: HiveManager.myBox?.get("logged") == null
              ? SplashScreen.routeName
              : HomeScreen.routeName,
          routes: {
            SplashScreen.routeName: (_) => SplashScreen(),
            SelectTypeGenderScreen.routeName: (_) => SelectTypeGenderScreen(),
            AuthenticationWayScreen.routeName: (_) => AuthenticationWayScreen(),
            SignInScreen.routeName: (_) => SignInScreen(),
            SignUpScreen.routeName: (_) => SignUpScreen(),
            ForgotPasswordScreen.routeName: (_) => ForgotPasswordScreen(),
            HomeScreen.routeName: (_) => HomeScreen(),
            NewArrivalDetailsScreen.routeName: (_) => NewArrivalDetailsScreen(),
            ViewAllReviewsScreen.routeName: (_) => ViewAllReviewsScreen(),
            AddReviewScreen.routeName: (_) => AddReviewScreen(),
            OrderConfirmedScreen.routeName: (_) => OrderConfirmedScreen(),
            AddressScreen.routeName: (_) => AddressScreen(),
            AddNewCardScreen.routeName: (_) => AddNewCardScreen(),
            PaymentScreen.routeName: (_) => PaymentScreen(),
          },
        );
      },
    );
  }
}
