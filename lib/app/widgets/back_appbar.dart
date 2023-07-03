import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/base_theme.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: BaseTheme.tertiaryColor,
      ),
      onPressed: () {
        Get.back();
      },
    ),
    title: Text(
      title,
      style: BaseTheme.mediumText.copyWith(
        fontSize: 20,
      ),
    ),
  );
}