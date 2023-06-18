import 'package:Evofly/app/services/video_service.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {

  @override
  void onInit() {
    VideoService().getVideo();
    super.onInit();
  }


}
