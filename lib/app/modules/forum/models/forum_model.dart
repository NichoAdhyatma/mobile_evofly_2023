import 'package:cloud_firestore/cloud_firestore.dart';

class ForumModel {
  String uid;
  String author;
  String title;
  String content;
  int tag;
  DateTime timestamp;

  ForumModel.fromJson(Map<String, dynamic> json)
      : author = json['author'],
        uid = json['uid'],
        title = json['title'],
        content = json['content'],
        tag = json['tag'],
        timestamp = json['timestamp'] != null
            ? (json['timestamp'] as Timestamp).toDate()
            : DateTime.now();
}
