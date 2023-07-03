import 'package:cloud_firestore/cloud_firestore.dart';

class WebinarModel {
  final String title;
  final String body;
  final String imageUrl;

  WebinarModel(this.title, this.body, this.imageUrl);

  WebinarModel.fromJson(QueryDocumentSnapshot<Object?> doc)
      : title = doc['title'],
        body = doc['body'],
        imageUrl = doc['imageUrl'];
}
