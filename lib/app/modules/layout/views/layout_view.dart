import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/evo_appbar.dart';
import '../controllers/layout_controller.dart';
import '../widgets/evo_bottom_appbar.dart';

class LayoutView extends GetView<LayoutController> {
  const LayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          Get.width,
          Get.height,
        ),
        child: const EvoAppBar(),
      ),
      body: Obx(() => controller.pages[controller.visit.value]),
      bottomNavigationBar: EvoBottomBar(controller: controller),
    );
  }
}
