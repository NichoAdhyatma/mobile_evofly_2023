import 'package:Evofly/app/services/video_service.dart';
import 'package:get/get.dart';

import '../models/video_model.dart';

class VideoController extends GetxController {
  List<VideoModel> video = [];
  VideoService videoService = VideoService();

  void fetchVideo() {
    video.clear();
    videoService.getVideo().then(
      (value) {
        if (value.docs.isNotEmpty) {
          for (var element in value.docs) {
            video.add(
              VideoModel(
                element['title'],
                element['video_id'],
              ),
            );
          }
          update();
        }
      },
    );
  }


}
