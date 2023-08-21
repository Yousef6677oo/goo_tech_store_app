import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utilities/app_themes.dart';

class ThemeProvider extends Cubit<CurrentTheme> {
  static ThemeData currentTheme = AppThemes.lightTheme;

  ThemeProvider() : super(LightTheme());

  convertToLightMode() {
    currentTheme = AppThemes.lightTheme;
    emit(LightTheme());
  }

  convertToDarkMode() {
    currentTheme = AppThemes.darkTheme;
    emit(DarkTheme());
  }

  convertToBlueMode() {
    currentTheme = AppThemes.blueTheme;
    emit(BlueTheme());
  }
}

abstract class CurrentTheme {}

class LightTheme extends CurrentTheme {}

class DarkTheme extends CurrentTheme {}

class BlueTheme extends CurrentTheme {}
