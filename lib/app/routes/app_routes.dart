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
  static const WEBINAR = _Paths.EDUKASI + _Paths.WEBINAR;
  static const DETAIL_WEBINAR =
      _Paths.EDUKASI + _Paths.WEBINAR + _Paths.DETAIL_WEBINAR;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const PROFILE = _Paths.PROFILE;
  static const MIDDLEWARE = _Paths.MIDDLEWARE;
  static const HISTORY = _Paths.HISTORY;
  static const CHAT = _Paths.CHAT;
  static const ROOM = _Paths.CHAT + _Paths.ROOM;
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
  static const WEBINAR = '/webinar';
  static const DETAIL_WEBINAR = '/detail-webinar';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const PROFILE = '/profile';
  static const MIDDLEWARE = '/middleware';
  static const HISTORY = '/history';
  static const CHAT = '/chat';
  static const ROOM = '/room';
}
