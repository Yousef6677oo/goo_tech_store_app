import 'package:e_commerce_app/provider/theme_provider.dart';
import 'package:e_commerce_app/ui/choose_way_to_authenticate/choose_way_to_authenticate_screen.dart';
import 'package:e_commerce_app/ui/select_type_gender/select_type_gender_screen.dart';
import 'package:e_commerce_app/ui/sign_in/sign_in.dart';
import 'package:e_commerce_app/ui/sign_up/sign_up_screen.dart';
import 'package:e_commerce_app/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
      create: (BuildContext context) {
    return ThemeProvider();
  },
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = BlocProvider.of<ThemeProvider>(context);
    return BlocBuilder(
      bloc: provider,
      buildWhen: (pre,current){
        return true;
        //todo: we should change this
      },
      builder: (context,state){
        return
          MaterialApp(
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
            SignUpScreen.routeName: (_) => SignUpScreen()
          },
        );
      },
    );
  }
}