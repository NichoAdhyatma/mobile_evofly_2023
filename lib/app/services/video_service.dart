import 'package:cloud_firestore/cloud_firestore.dart';

class VideoService {
  void getVideo() async {
    print("get video running");
    var data = await FirebaseFirestore.instance.collection('video').get();
    print(data);
  }
}
