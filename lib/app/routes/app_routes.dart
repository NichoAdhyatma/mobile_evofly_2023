part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const EDUKASI = _Paths.EDUKASI;
  static const LAYOUT = _Paths.LAYOUT;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const EDUKASI = '/edukasi';
  static const LAYOUT = '/layout';
}
