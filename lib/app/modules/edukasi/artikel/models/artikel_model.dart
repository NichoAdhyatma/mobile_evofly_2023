import 'package:cloud_firestore/cloud_firestore.dart';

class ArtikelModel {
  final String title;
  final String body;
  final String imageUrl;

  ArtikelModel(this.title, this.body, this.imageUrl);

  ArtikelModel.fromJson(QueryDocumentSnapshot<Object?> doc)
      : title = doc['title'],
        body = doc['body'],
        imageUrl = doc['imageUrl'];
}
