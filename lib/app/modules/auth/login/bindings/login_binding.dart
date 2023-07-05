import 'package:get/get.dart';

import '../../../../helper/connection_state.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.put(ConnectionState(), permanent: true);
  }
}
