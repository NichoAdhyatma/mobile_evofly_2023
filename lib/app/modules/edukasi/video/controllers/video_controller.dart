import 'package:Evofly/app/services/video_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/video_model.dart';

class VideoController extends GetxController {
  List<VideoModel> video = [];
  VideoService videoService = VideoService();

  void fetchVideo() {
    video.clear();
    videoService.getVideo().then(
      (documentList) {
        if (documentList.isNotEmpty) {
          assignVideo(documentList);
        }
      },
    );
  }

  void assignVideo(List<QueryDocumentSnapshot<Object?>> documentList) {
    for (var element in documentList) {
      video.add(
        VideoModel(
          element['title'],
          element['video_id'],
        ),
      );
    }
    update();
  }
}
