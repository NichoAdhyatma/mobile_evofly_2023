import 'package:Evofly/app/modules/forum/views/forum_view.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';

class LayoutController extends GetxController {
  RxInt visit = 0.obs;

  final pages = [
    const HomeView(),
    const ForumView(),
    const ProfileView(),
  ];

  void changeVisit(int val) {
    visit.value = val;
  }
}
