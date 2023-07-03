import 'package:Evofly/app/widgets/back_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../services/video_service.dart';
import '../../../../widgets/skeleton_cards.dart';
import '../controllers/video_controller.dart';

import '../widgets/video_list.dart';

class VideoView extends GetView<VideoController> {
  const VideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Video Edukasi"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GetBuilder<VideoController>(
          initState: (_) => controller.fetchVideo(),
          builder: (VideoController controller) => FutureBuilder(
            future: VideoService().getVideo(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SkeletonCardList(
                  count: 6,
                );
              }
              return snapshot.hasData
                  ? VideoList(videoList: controller.videos)
                  : const Center(child: Text("Video not found ...."));
            },
          ),
        ),
      ),
    );
  }
}
