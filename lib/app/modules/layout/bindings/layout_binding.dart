import 'package:Evofly/app/modules/history/controllers/history_controller.dart';
import 'package:Evofly/app/modules/home/controllers/home_controller.dart';
import 'package:Evofly/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutController>(
      () => LayoutController(),
    );

    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<HistoryController>(() => HistoryController());
  }
}
