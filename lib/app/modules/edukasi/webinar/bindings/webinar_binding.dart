import 'package:get/get.dart';

import '../controllers/webinar_controller.dart';

class WebinarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebinarController>(
      () => WebinarController(),
    );
  }
}
