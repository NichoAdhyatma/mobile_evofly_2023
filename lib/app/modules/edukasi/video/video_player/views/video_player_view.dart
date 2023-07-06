import 'package:Evofly/app/themes/base_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../widgets/back_appbar.dart';
import '../controllers/video_player_controller.dart';
import '../widgets/play_controll_button.dart';

class VideoPlayerView extends GetView<VideoPlayerController> {
  const VideoPlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoPlayerController>(
      initState: (_) => controller.initVideo(Get.arguments),
      builder: (VideoPlayerController controller) => Scaffold(
        appBar: buildAppBar(title: "Video"),
        body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: controller.youtubePlayerController!,
            showVideoProgressIndicator: true,
            progressIndicatorColor: BaseTheme.tertiaryColor,
            liveUIColor: BaseTheme.secondaryColor,
            progressColors: const ProgressBarColors(
              backgroundColor: BaseTheme.whiteColor,
              playedColor: BaseTheme.secondaryColor,
            ),
          ),
          builder: (BuildContext context, Widget videoPlayer) {
            return Column(
              children: [
               Flexible(child: videoPlayer),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    controller.video!.title,
                    textAlign: TextAlign.center,
                    style: BaseTheme.mediumText.copyWith(fontSize: 27),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 40,
                  ),
                  child: PlayControlButton(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
