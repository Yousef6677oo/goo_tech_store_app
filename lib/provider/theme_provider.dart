import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeProvider extends Cubit<CurrentTheme> {
  ThemeMode currentTheme = ThemeMode.system;

  ThemeProvider() : super(InitState());

  convertToLightMode() {
    currentTheme = ThemeMode.light;
    emit(LightTheme());
  }

  convertToDarkMode() {
    currentTheme = ThemeMode.dark;
    emit(DarkTheme());
  }
}

abstract class CurrentTheme {}

class InitState extends CurrentTheme {}

class LightTheme extends CurrentTheme {}

class DarkTheme extends CurrentTheme {}
