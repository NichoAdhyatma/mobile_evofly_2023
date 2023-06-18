import 'package:Evofly/app/modules/edukasi/video/const/url.dart';
import 'package:Evofly/app/modules/edukasi/video/models/video_model.dart';
import 'package:Evofly/app/widgets/evo_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/video_controller.dart';

class VideoView extends GetView<VideoController> {
  const VideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, Get.height),
        child: const EvoAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GetBuilder<VideoController>(
          initState: (_) => controller.fetchVideo(),
          builder: (VideoController controller) => ListView.builder(
            itemCount: controller.video.length,
            itemBuilder: (BuildContext context, int index) {
              VideoModel video = controller.video[index];
              return ListTile(
                leading: Image.network(
                    "${EvoUrl.imageYtUrl}/${video.videoId}/0.jpg"),
                title: Text(controller.video[index].title),
              );
            },
          ),
        ),
      ),
    );
  }
}
