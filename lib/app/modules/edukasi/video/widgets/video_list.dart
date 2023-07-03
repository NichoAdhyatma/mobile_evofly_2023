import 'package:Evofly/app/modules/edukasi/video/widgets/video_card.dart';
import 'package:flutter/material.dart';

import '../models/video_model.dart';

class VideoList extends StatelessWidget {
  const VideoList({
    super.key, required this.videoList,
  });

  final List<VideoModel> videoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoList.length,
      itemBuilder: (BuildContext context, int index) {
        VideoModel video = videoList[index];
        return VideoCard(video: video);
      },
    );
  }
}
