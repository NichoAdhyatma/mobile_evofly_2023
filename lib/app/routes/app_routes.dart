part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const EDUKASI = _Paths.EDUKASI;
  static const LAYOUT = _Paths.LAYOUT;
  static const VIDEO = _Paths.EDUKASI + _Paths.VIDEO;
  static const VIDEO_PLAYER =
      _Paths.EDUKASI + _Paths.VIDEO + _Paths.VIDEO_PLAYER;
  static const ARTIKEL = _Paths.EDUKASI + _Paths.ARTIKEL;
  static const DETAIL_ARTIKEL =
      _Paths.EDUKASI + _Paths.ARTIKEL + _Paths.DETAIL_ARTIKEL;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const EDUKASI = '/edukasi';
  static const LAYOUT = '/layout';
  static const VIDEO = '/video';
  static const VIDEO_PLAYER = '/video-player';
  static const ARTIKEL = '/artikel';
  static const DETAIL_ARTIKEL = '/detail-artikel';
}
