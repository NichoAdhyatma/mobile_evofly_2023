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
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(BaseTheme.blueColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: const BorderSide(
        width: 1.0,
        color: BaseTheme.whiteColor,
      ),
    ),
    shadowColor: BaseTheme.shadowColor,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateTextStyle.resolveWith(
          (states) => const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor:
            MaterialStateProperty.resolveWith((state) => Colors.grey[500]),
      ),
    ),
  );
}
