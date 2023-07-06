import 'package:Evofly/app/modules/edukasi/video/models/video_model.dart';
import 'package:Evofly/app/services/base_service.dart';

class VideoService extends BaseService {
  Future<List<VideoModel>> getVideo() async {
    return handleFirestoreError<List<VideoModel>>(
      () async {
        final querySnapshot = await firestore.collection('video').get();
        return querySnapshot.docs
            .map((doc) => VideoModel.fromJson(doc))
            .toList();
      },
    );
  }
}
