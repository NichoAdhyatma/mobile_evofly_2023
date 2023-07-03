import 'package:flutter/material.dart';

import '../../../../routes/app_pages.dart';
import '../../../../themes/base_theme.dart';
import '../const/url.dart';
import '../models/video_model.dart';
import 'package:get/get.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    super.key,
    required this.video,
  });

  final VideoModel video;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: GestureDetector(
        onTap: () =>
            Get.toNamed(Routes.VIDEO_PLAYER, arguments: video),
        child: Material(
          color: BaseTheme.whiteColor,
          elevation: 5,
          shadowColor: BaseTheme.shadowColor,
          borderRadius: BorderRadius.circular(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                width: 170,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(
                        "${EvoUrl.imageYtUrl}/${video.videoId}/0.jpg",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    video.title,
                    style: BaseTheme.mediumText.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}