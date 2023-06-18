import 'package:get/get.dart';

import '../controllers/video_controller.dart';

class VideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<VideoController>(
      VideoController(),
    );
  }
}
