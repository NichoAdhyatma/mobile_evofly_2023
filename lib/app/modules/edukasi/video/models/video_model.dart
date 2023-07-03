import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {
  final String title;
  final String videoId;

  VideoModel(this.title, this.videoId);

  VideoModel.fromJson(QueryDocumentSnapshot<Object?> doc)
      : title = doc['title'],
        videoId = doc['video_id'];
}
