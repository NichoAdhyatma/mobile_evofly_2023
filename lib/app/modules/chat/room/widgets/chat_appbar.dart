import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../themes/base_theme.dart';

AppBar buildChatAppbar({required String name, required String status}) {
  return AppBar(
    leading: IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: BaseTheme.shadowColor,
      ),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: BaseTheme.normalText.copyWith(
            fontSize: 14,
          ),
        ),
        Text(
          status,
          style: BaseTheme.secondaryText.copyWith(
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}