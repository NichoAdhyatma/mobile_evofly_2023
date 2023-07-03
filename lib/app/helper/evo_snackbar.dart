import 'package:Evofly/app/themes/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSuccessSnackbar({required String title, required String message}) {
  Get.snackbar(
    title,
    message,
    colorText: BaseTheme.whiteColor,
    backgroundColor: Colors.green[500],
    icon: const Icon(Icons.done_outline_rounded),
    animationDuration: const Duration(milliseconds: 300),
  );
}

void showInfoSnackbar({required String title, required String message}) {
  Get.snackbar(
    title,
    message,
    colorText: BaseTheme.whiteColor,
    backgroundColor: Colors.blue[500],
    icon: const Icon(Icons.info),
    animationDuration: const Duration(milliseconds: 300),
  );
}

void showErrorSnackbar({required String title, required String message}) {
  Get.snackbar(
    title,
    message,
    colorText: BaseTheme.whiteColor,
    backgroundColor: Colors.red[500],
    icon: const Icon(Icons.error),
    animationDuration: const Duration(milliseconds: 300),
  );
}
