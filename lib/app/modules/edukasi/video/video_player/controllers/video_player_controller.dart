import 'package:Evofly/app/modules/edukasi/video/models/video_model.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerController extends GetxController {
  VideoModel? video;
  YoutubePlayerController? youtubePlayerController;
  Rx<bool> isPlay = false.obs;
  bool isFullScreen = false;

  @override
  void dispose() {
    youtubePlayerController?.dispose();
    super.dispose();
  }

  void initVideo(VideoModel video) {
    this.video = video;
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: video.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        forceHD: true,
      ),
    );

    youtubePlayerController?.addListener(() {
       setIsPlay(youtubePlayerController!.value.isPlaying);
       setIsFullScreen(youtubePlayerController!.value.isFullScreen);
    });

    update();
  }


  void playPauseVideo() {
    var playState = youtubePlayerController!.value.isPlaying;
    playState
        ? youtubePlayerController?.pause()
        : youtubePlayerController?.play();
    setIsPlay(!playState);
  }

  void setIsFullScreen(bool val) {
    isFullScreen = val;
    update();
  }

  void setIsPlay(bool val) {
    isPlay.value = val;
  }
}
