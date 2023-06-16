import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/evo_appbar.dart';
import '../../../widgets/evo_bottom_appbar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.9),
        child: const EvoAppBar(),
      ),
      body: const Center(
        child: Text(
          'HomeView',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: EvoBottomBar(controller: controller),
    );
  }
}


