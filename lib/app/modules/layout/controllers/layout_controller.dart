import 'package:get/get.dart';

import '../../history/views/history_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';

class LayoutController extends GetxController {
  RxInt visit = 0.obs;

  final pages = [
    const HomeView(),
    const HistoryView(),
    const ProfileView(),
  ];

  void changeVisit(int val) {
    visit.value = val;
  }
}
