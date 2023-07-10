class VideoModel {
  final String title;
  final String videoId;
  final String imageUrl;

  VideoModel(this.title, this.videoId, this.imageUrl);

  VideoModel.fromJson(Map<String, dynamic> doc)
      : title = doc['title'],
        videoId = doc['video_id'],
        imageUrl = doc['imageUrl'];

}
