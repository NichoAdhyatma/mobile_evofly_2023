import 'package:Evofly/app/widgets/evo_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/video_controller.dart';
import '../widgets/video_list.dart';

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
        child: VideoList(controller: controller),
      ),
    );
  }
}


