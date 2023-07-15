import 'package:get/get.dart';

class ForumController extends GetxController {
  Rx<int> selectedSort = 0.obs;
  Rx<int> selectedTag = 0.obs;

  setSelectedSort(int value) {
    selectedSort.value = value;
  }

  setSelectedTag(int value) {
    selectedTag.value = value;
  }
}
