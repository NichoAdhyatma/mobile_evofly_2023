import 'package:Evofly/app/routes/app_pages.dart';
import 'package:Evofly/app/services/video_service.dart';
import 'package:Evofly/app/widgets/back_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../builder/content_builder.dart';
import '../controllers/video_controller.dart';

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
          builder: (VideoController controller) => contentBuilder(
              controller.videos,
              futureService: VideoService().getVideo(),
              routes: Routes.VIDEO_PLAYER),
        ),
      ),
    );
  }
}
