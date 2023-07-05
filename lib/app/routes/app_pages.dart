import 'package:get/get.dart';

import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/edukasi/artikel/bindings/artikel_binding.dart';
import '../modules/edukasi/artikel/detail_artikel/bindings/detail_artikel_binding.dart';
import '../modules/edukasi/artikel/detail_artikel/views/detail_artikel_view.dart';
import '../modules/edukasi/artikel/views/artikel_view.dart';
import '../modules/edukasi/bindings/edukasi_binding.dart';
import '../modules/edukasi/video/bindings/video_binding.dart';
import '../modules/edukasi/video/video_player/bindings/video_player_binding.dart';
import '../modules/edukasi/video/video_player/views/video_player_view.dart';
import '../modules/edukasi/video/views/video_view.dart';
import '../modules/edukasi/views/edukasi_view.dart';
import '../modules/edukasi/webinar/bindings/webinar_binding.dart';
import '../modules/edukasi/webinar/detail_webinar/bindings/detail_webinar_binding.dart';
import '../modules/edukasi/webinar/detail_webinar/views/detail_webinar_view.dart';
import '../modules/edukasi/webinar/views/webinar_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/layout/bindings/layout_binding.dart';
import '../modules/layout/views/layout_view.dart';
import '../modules/middleware/bindings/middleware_binding.dart';
import '../modules/middleware/views/middleware_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MIDDLEWARE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EDUKASI,
      page: () => const EdukasiView(),
      binding: EdukasiBinding(),
      transitionDuration: const Duration(
        milliseconds: 330,
      ),
      transition: Transition.cupertino,
      children: [
        GetPage(
          name: _Paths.VIDEO,
          page: () => const VideoView(),
          binding: VideoBinding(),
          transitionDuration: const Duration(
            milliseconds: 330,
          ),
          transition: Transition.cupertino,
          children: [
            GetPage(
              name: _Paths.VIDEO_PLAYER,
              page: () => const VideoPlayerView(),
              binding: VideoPlayerBinding(),
              transitionDuration: const Duration(
                milliseconds: 330,
              ),
              transition: Transition.cupertino,
            ),
          ],
        ),
        GetPage(
          name: _Paths.ARTIKEL,
          page: () => const ArtikelView(),
          binding: ArtikelBinding(),
          transitionDuration: const Duration(
            milliseconds: 330,
          ),
          transition: Transition.cupertino,
          children: [
            GetPage(
              name: _Paths.DETAIL_ARTIKEL,
              page: () => const DetailArtikelView(),
              binding: DetailArtikelBinding(),
              transitionDuration: const Duration(
                milliseconds: 330,
              ),
              transition: Transition.cupertino,
            ),
          ],
        ),
        GetPage(
          name: _Paths.WEBINAR,
          page: () => const WebinarView(),
          binding: WebinarBinding(),
          transitionDuration: const Duration(
            milliseconds: 330,
          ),
          transition: Transition.cupertino,
          children: [
            GetPage(
              name: _Paths.DETAIL_WEBINAR,
              page: () => const DetailWebinarView(),
              binding: DetailWebinarBinding(),
            ),
          ],
        ),
      ],
    ),
    GetPage(
      name: _Paths.LAYOUT,
      page: () => const LayoutView(),
      binding: LayoutBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transitionDuration: const Duration(
        milliseconds: 330,
      ),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MIDDLEWARE,
      page: () => const MiddlewareView(),
      binding: MiddlewareBinding(),
    ),
  ];
}
