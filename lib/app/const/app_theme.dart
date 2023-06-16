import 'package:flutter/material.dart';

abstract class ThemeConfig {
  //initialize
  ThemeConfig._();

  //color configuration
  static const primaryColor = Colors.white;
  static const secondaryColor = Color(0xff7C8498);
  static const tertiaryColor = Color(0xff374957);

  //theme-data configuration
  static ThemeData themeData = ThemeData(
    fontFamily: 'Poppins',
    iconTheme: const IconThemeData(
      color: tertiaryColor,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: tertiaryColor,
    ),
  );
}
