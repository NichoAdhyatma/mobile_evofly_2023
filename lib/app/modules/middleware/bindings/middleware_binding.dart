import 'package:Evofly/app/helper/firebase_notification.dart';
import 'package:Evofly/app/helper/notif.dart';
import 'package:get/get.dart';

import '../../../helper/connection_state.dart';
import '../controllers/middleware_controller.dart';

class MiddlewareBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MiddlewareController(), permanent: true);
    Get.put(ConnectionState(), permanent: true);
    Get.put(Notif(), permanent: true);
    Get.put(FireBaseNotif(), permanent: true);
  }
}
