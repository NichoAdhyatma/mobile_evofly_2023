import 'package:flutter/material.dart';

abstract class BaseTheme {
  BaseTheme._();

  //color configuration
  static const primaryColor = Colors.white;
  static const secondaryColor = Color(0xff7C8498);
  static const tertiaryColor = Color(0xff374957);
  static const scaffoldBgColor = Color(0xffEEEEEE);
  static const whiteColor = Color(0xffFFFFFF);
  static const shadowColor = Color(0xff000000);

  //input-border
  static InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(75),
    borderSide: const BorderSide(
      width: 0,
      style: BorderStyle.none,
    ),
  );

  static const mediumText = TextStyle(
    fontWeight: FontWeight.w500,
    color: shadowColor,
  );
}
