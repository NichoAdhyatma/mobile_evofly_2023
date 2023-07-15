import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../themes/base_theme.dart';
import '../controllers/forum_controller.dart';

class SortingCheckBox extends GetView<ForumController> {
  const SortingCheckBox({
    super.key,
    required this.id,
    required this.text,
  });

  final int id;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.setSelectedSort(id),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: BaseTheme.mediumText.copyWith(
              color: BaseTheme.whiteColor.withOpacity(
                0.8,
              ),
            ),
          ),
          Obx(
                () => Checkbox(
              value: controller.selectedSort.value == id ? true : false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onChanged: (_) {
                controller.setSelectedSort(id);
              },
            ),
          ),
        ],
      ),
    );
  }
}