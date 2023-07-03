import 'package:get/get.dart';

import '../controllers/detail_webinar_controller.dart';

class DetailWebinarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailWebinarController>(
      () => DetailWebinarController(),
    );
  }
}
