import 'package:Evofly/app/modules/forum/controllers/forum_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/base_theme.dart';
import 'modal_bottomsheet.dart';
import 'package:hidable/hidable.dart';

class Header extends GetView<ForumController> {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSwitcher(
        duration: const Duration(milliseconds: 330),
        child: controller.isVisible.value? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Forum',
              style: BaseTheme.mediumText.copyWith(
                fontSize: 25,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                backgroundColor: BaseTheme.semidark,
              ),
              onPressed: () {
                buildModalBottomSheet(context).whenComplete(
                  () => controller.setSelectedTag(0),
                );
              },
              child: Row(
                children: [
                  Text(
                    "Sorting dan Tag",
                    style: BaseTheme.mediumText.copyWith(
                      color: BaseTheme.whiteColor,
                      fontSize: 15,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ) : SizedBox.shrink(),
      ),
    );
  }
}
