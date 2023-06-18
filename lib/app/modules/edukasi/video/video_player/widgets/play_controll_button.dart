import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../themes/base_theme.dart';
import '../controllers/video_player_controller.dart';

class PlayControlButton extends GetView<VideoPlayerController> {
  const PlayControlButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.playPauseVideo();
      },
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(controller.isPlay.value
                ? Icons.pause
                : Icons.play_arrow_rounded),
            const SizedBox(
              width: 10,
            ),
            Text(
              controller.isPlay.value ? "Berhenti" : "Putar",
              style: BaseTheme.mediumText.copyWith(
                fontSize: 20,
                color: BaseTheme.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
