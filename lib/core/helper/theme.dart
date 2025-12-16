import 'package:flutter/material.dart';

final class CustomTheme {
  CustomTheme._();
  static const MaterialColor kToDark = MaterialColor(
    0xFFD9E4F1, 
    <int, Color>{
     
      50: Color(0xFFD9E4F1), //10%
      100: Color(0xFFD9E4F1), //20%
      200: Color(0xFFD9E4F1), //30%
      300: Color(0xFFD9E4F1), //40%
      400: Color(0xFFD9E4F1), //50%
      500: Color(0xFFD9E4F1), //60%
      600: Color(0xFFD9E4F1), //70%
      700: Color(0xFFD9E4F1), //80%
      800: Color(0xFFD9E4F1), //80%
      900: Color(0xFFD9E4F1), //80%
    },
  );
  static ThemeData get mainTheme {
    return ThemeData(
      primaryColor: Color(0xFFD9E4F1),
      primarySwatch: CustomTheme.kToDark,
      scaffoldBackgroundColor: Color(0xFFD9E4F1),
    );
  }
}