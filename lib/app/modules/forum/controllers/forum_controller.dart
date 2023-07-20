import 'package:Evofly/app/modules/forum/models/forum_model.dart';
import 'package:Evofly/app/services/forum_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../../helper/evo_snackbar.dart';

class ForumController extends GetxController {
  Rx<int> selectedSort = 0.obs;
  Rx<int> selectedTag = 0.obs;
  Rx<bool> titleValue = false.obs;
  Rx<bool> contentValue = false.obs;
  Rx<bool> isUpload = false.obs;
  Rx<bool> isLoading = false.obs;
  Rx<bool> isVisible = true.obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  ScrollController scrollController = ScrollController();

  FocusNode titleFocus = FocusNode();
  FocusNode contentFocus = FocusNode();

  RxList<ForumModel> forumList = <ForumModel>[].obs;
  
  @override
  void onInit() {
    scrollController.addListener(() {
      if(scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        isVisible.value = false;
      } else {
        isVisible.value = true;
      }
    });
    super.onInit();
  }

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
        .then(
      (_) {
        Get.back();
        showSuccessSnackbar(
          title: "Success",
          message: "Berhasil mengupload forum",
        );
      },
    );

    fetchForum();
  }

  Future<void> fetchForum() async {
    isLoading.value = true;

    ForumService()
        .getForum()
        .then((forum) => forumList.assignAll(forum))
        .whenComplete(
          () => isLoading.value = false,
        );
  }
}
