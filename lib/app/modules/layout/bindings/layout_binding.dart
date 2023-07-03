import 'package:Evofly/app/helper/connection_state.dart';
import 'package:get/get.dart';

import '../controllers/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutController>(
      () => LayoutController(),
    );

    Get.put(ConnectionState());
  }
}
