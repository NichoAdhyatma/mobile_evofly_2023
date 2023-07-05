import 'package:get/get.dart';

import '../controllers/middleware_controller.dart';

class MiddlewareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MiddlewareController>(
      () => MiddlewareController(),
    );
  }
}
