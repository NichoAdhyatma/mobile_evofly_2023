class WebinarModel {
  final String title;
  final String body;
  final String imageUrl;

  WebinarModel(this.title, this.body, this.imageUrl);

  WebinarModel.fromJson(Map<String, dynamic> doc)
      : title = doc['title'],
        body = doc['body'],
        imageUrl = doc['imageUrl'];
}
