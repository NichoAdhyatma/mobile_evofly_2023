import 'package:Evofly/app/modules/edukasi/video/models/video_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VideoService {
  CollectionReference videos = FirebaseFirestore.instance.collection('video');

  Future<List<VideoModel>> getVideo() async {
    QuerySnapshot document = await videos.get();

    List<VideoModel> listVideoModel = [];

    for (var doc in document.docs) {
      listVideoModel.add(VideoModel.fromJson(doc));
    }

    return listVideoModel;
  }
}
