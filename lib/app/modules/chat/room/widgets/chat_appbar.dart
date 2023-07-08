import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../themes/base_theme.dart';
import '../controllers/room_controller.dart';

AppBar buildChatAppbar(RoomController controller) {
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
          controller.partner.value.name,
          style: BaseTheme.normalText.copyWith(
            fontSize: 14,
          ),
        ),
        Text(
          controller.partner.value.status,
          style: BaseTheme.secondaryText.copyWith(
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}