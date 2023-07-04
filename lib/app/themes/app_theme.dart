import 'package:flutter/material.dart';

import 'base_theme.dart';

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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: BaseTheme.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        disabledBackgroundColor: BaseTheme.secondaryColor.withOpacity(0.6),
      ),
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
      labelStyle: BaseTheme.mediumText,
    ),
    shadowColor: BaseTheme.shadowColor,
  );
}
