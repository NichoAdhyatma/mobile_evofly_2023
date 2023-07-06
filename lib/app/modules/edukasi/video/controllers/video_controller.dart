import 'package:Evofly/app/services/video_service.dart';
import 'package:get/get.dart';

import '../models/video_model.dart';

class VideoController extends GetxController {
  List<VideoModel> videos = [];
  VideoService videoService = VideoService();

  void fetchVideo() {
    videos.clear();
    videoService.getVideo().then(
      (videoList) {
        videos.addAll(videoList);

      },
    );
  }
}
