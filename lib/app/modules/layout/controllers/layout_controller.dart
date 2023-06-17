import 'package:get/get.dart';

class LayoutController extends GetxController {
  RxInt visit = 0.obs;

  void changeVisit(int val) {
    visit.value = val;
  }
}
