import 'package:cloud_firestore/cloud_firestore.dart';

class VideoService {
  CollectionReference videos = FirebaseFirestore.instance.collection('video');

  Future<QuerySnapshot> getVideo() async {
    QuerySnapshot document = await videos.get();
    return document;
  }
}
