import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt visit = 0.obs;

  void changeVisit(int val) {
    visit.value = val;
  }
}
