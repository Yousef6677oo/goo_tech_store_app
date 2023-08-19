import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.primaryColorLight,
      splashColor: AppColors.accentColorLight,
      cardColor: AppColors.genderBottomColorLight,
      appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
      secondaryHeaderColor: AppColors.secondaryHeaderColorLight,
      bottomAppBarTheme:
          const BottomAppBarTheme(color: AppColors.accentColorLight),
      hintColor: AppColors.hintColorLight);

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.primaryColorDark,
      splashColor: AppColors.primaryColorDark,
      cardColor: AppColors.genderBottomColorDark,
      appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
      secondaryHeaderColor: AppColors.secondaryHeaderColorDark,
      bottomAppBarTheme:
          const BottomAppBarTheme(color: AppColors.accentColorDark),
      hintColor: AppColors.hintColorDark);

  static ThemeData blueTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryColorBlue,
    splashColor: AppColors.accentColorBlue,
    cardColor: AppColors.genderBottomColorBlue,
    appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
    secondaryHeaderColor: AppColors.secondaryHeaderColorBlue,
    bottomAppBarTheme:
        const BottomAppBarTheme(color: AppColors.accentColorBlue),
    hintColor: AppColors.hintColorBlue,
  );
}
