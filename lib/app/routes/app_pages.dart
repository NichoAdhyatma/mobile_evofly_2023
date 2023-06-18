import 'package:get/get.dart';

import '../modules/edukasi/bindings/edukasi_binding.dart';
import '../modules/edukasi/video/bindings/video_binding.dart';
import '../modules/edukasi/video/views/video_view.dart';
import '../modules/edukasi/views/edukasi_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/layout/bindings/layout_binding.dart';
import '../modules/layout/views/layout_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LAYOUT;

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
        ),
      ],
    ),
    GetPage(
      name: _Paths.LAYOUT,
      page: () => const LayoutView(),
      binding: LayoutBinding(),
    ),
  ];
}
