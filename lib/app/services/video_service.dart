import 'package:cloud_firestore/cloud_firestore.dart';

class VideoService {
  CollectionReference videos = FirebaseFirestore.instance.collection('video');

  Future<List<QueryDocumentSnapshot<Object?>>> getVideo() async {
    QuerySnapshot document = await videos.get();
    return document.docs;
  }
}
