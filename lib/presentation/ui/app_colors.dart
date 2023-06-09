import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor appcolors =
      MaterialColor(_appcolorsPrimaryValue, <int, Color>{
    50: Color(0xFFE8EAF6),
    100: Color(0xFFC5CBE9),
    200: Color(0xFF9FA8DA),
    300: Color(0xFF7985CB),
    400: Color(0xFF5C6BC0),
    500: Color(_appcolorsPrimaryValue),
    600: Color(0xFF394AAE),
    700: Color(0xFF3140A5),
    800: Color(0xFF29379D),
    900: Color(0xFF1B278D),
  });
  static const int _appcolorsPrimaryValue = 0xFF3F51B5;

  static const grayColor = Colors.grey;
  static const whiteColor = Colors.white;
  static const redColor = Colors.red;

  static const MaterialColor appcolorsAccent =
      MaterialColor(_appcolorsAccentValue, <int, Color>{
    100: Color(0xFFC6CBFF),
    200: Color(_appcolorsAccentValue),
    400: Color(0xFF606EFF),
    700: Color(0xFF4757FF),
  });
  static const int _appcolorsAccentValue = 0xFF939DFF;
}
