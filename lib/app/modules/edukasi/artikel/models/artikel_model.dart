class ArtikelModel {
  final String title;
  final List<String> body;
  final String imageUrl;

  ArtikelModel(this.title, this.body, this.imageUrl);

  ArtikelModel.fromJson(Map<String, dynamic> doc)
      : title = doc['title'],
        body = List<String>.from(doc['body']),
        imageUrl = doc['imageUrl'];
}
