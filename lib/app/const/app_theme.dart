import 'package:Evofly/app/const/base_theme.dart';
import 'package:flutter/material.dart';

abstract class ThemeConfig {
  //initialize
  ThemeConfig._();

  //theme-data configuration
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: BaseTheme.scaffoldBgColor,
    fontFamily: 'Poppins',
    iconTheme: const IconThemeData(
      color: BaseTheme.tertiaryColor,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: BaseTheme.primaryColor,
      primary: BaseTheme.primaryColor,
      secondary: BaseTheme.secondaryColor,
      tertiary: BaseTheme.tertiaryColor,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: BaseTheme.secondaryColor,
      selectionHandleColor: BaseTheme.secondaryColor,
      selectionColor: BaseTheme.secondaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: BaseTheme.whiteColor,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 14,
      ),
      prefixIconColor: BaseTheme.secondaryColor,
      enabledBorder: BaseTheme.inputBorder,
      focusedBorder: BaseTheme.inputBorder,
      border: BaseTheme.inputBorder,
    ),
  );
}
