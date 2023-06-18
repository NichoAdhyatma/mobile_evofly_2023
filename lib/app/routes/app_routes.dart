part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const EDUKASI = _Paths.EDUKASI;
  static const LAYOUT = _Paths.LAYOUT;
  static const VIDEO = _Paths.EDUKASI + _Paths.VIDEO;
  static const VIDEO_PLAYER =
      _Paths.EDUKASI + _Paths.VIDEO + _Paths.VIDEO_PLAYER;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const EDUKASI = '/edukasi';
  static const LAYOUT = '/layout';
  static const VIDEO = '/video';
  static const VIDEO_PLAYER = '/video-player';
}
