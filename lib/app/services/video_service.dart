import 'package:Evofly/app/modules/edukasi/video/models/video_model.dart';
import 'package:Evofly/app/services/base_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VideoService extends BaseService {

  Future<List<VideoModel>> getVideo() async {
    QuerySnapshot document = await firestore.collection("video").get();

    List<VideoModel> listVideoModel = [];

    for (var doc in document.docs) {
      listVideoModel.add(VideoModel.fromJson(doc));
    }

    return listVideoModel;
  }
}
