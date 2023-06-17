import 'package:get/get.dart';

import '../controllers/edukasi_controller.dart';

class EdukasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EdukasiController>(
      () => EdukasiController(),
    );
  }
}
