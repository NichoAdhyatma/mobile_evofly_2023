import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForumController extends GetxController {
  Rx<int> selectedSort = 0.obs;
  Rx<int> selectedTag = 0.obs;
  Rx<bool> titleValue = false.obs;
  Rx<bool> contentValue = false.obs;
  Rx<bool> isUpload = false.obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void isTitleEmpty() {
    titleController.text.trim().isNotEmpty
        ? titleValue.value = true
        : titleValue.value = false;
  }

  void isContentEmpty() {
    contentController.text.trim().isNotEmpty
        ? contentValue.value = true
        : contentValue.value = false;
  }


  void canUpload() {
    isTitleEmpty();
    isContentEmpty();

    titleValue.value && contentValue.value
        ? isUpload.value = true
        : isUpload.value = false;
  }

  setSelectedSort(int value) {
    selectedSort.value = value;
  }

  setSelectedTag(int value) {
    selectedTag.value = value;
  }
}
