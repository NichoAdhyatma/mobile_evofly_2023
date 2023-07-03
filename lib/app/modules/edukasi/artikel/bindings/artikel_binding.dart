import 'package:get/get.dart';

import '../controllers/artikel_controller.dart';

class ArtikelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArtikelController>(
      () => ArtikelController(),
    );
  }
}
