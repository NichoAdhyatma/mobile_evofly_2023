import 'package:get/get.dart';

import '../../../helper/connection_state.dart';
import '../controllers/middleware_controller.dart';

class MiddlewareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MiddlewareController>(
      () => MiddlewareController(),
    );
    Get.put(ConnectionState(), permanent: true);
  }
}
