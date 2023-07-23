import 'package:Evofly/app/modules/forum/controllers/forum_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/labe_list.dart';
import '../../../themes/base_theme.dart';

class LabelTag extends GetView<ForumController> {
  const LabelTag({super.key, required this.id, required this.text});

  final String text;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.setSelectedTag(id),
      child: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 2.0,
          ),
          decoration: BoxDecoration(
            color: controller.selectedTag.value == id && id != 0
                ? BaseTheme.blueColor
                : BaseTheme.semidark,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            id != 0 ? labelList[id-1] : text,
            style: BaseTheme.mediumText.copyWith(
              color: BaseTheme.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
