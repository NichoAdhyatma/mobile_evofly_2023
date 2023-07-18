import 'package:Evofly/app/services/forum_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../helper/evo_snackbar.dart';

class ForumController extends GetxController {
  Rx<int> selectedSort = 0.obs;
  Rx<int> selectedTag = 0.obs;
  Rx<bool> titleValue = false.obs;
  Rx<bool> contentValue = false.obs;
  Rx<bool> isUpload = false.obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  FocusNode titleFocus = FocusNode();
  FocusNode contentFocus = FocusNode();

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

  Future<void> addForum() async {
    titleFocus.unfocus();
    contentFocus.unfocus();

    ForumService()
        .addForm(
      title: titleController.text,
      content: contentController.text,
      tag: selectedTag.value,
    )
        .then((_) {
      Get.back();
      showSuccessSnackbar(
        title: "Success",
        message: "Berhasil mengupload forum",
      );
    });
  }
}
