import 'package:Evofly/app/modules/forum/controllers/forum_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/base_theme.dart';
import 'label_row.dart';

Future<dynamic> buildAddForumModal(BuildContext context, ForumController controller) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => ListView(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 30,
            left: 12,
            right: 12,
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.close_rounded,
                  size: 40,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Obx(
                    () => TextField(
                  controller: controller.titleController,
                  onChanged: (_) {
                    controller.canUpload();
                  },
                  focusNode: controller.titleFocus,
                  decoration: BaseTheme.borderInputSecondary.copyWith(
                    label: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text("Judul"),
                    ),
                    hintText: "Judul Topik tidak boleh kosong",
                    suffixIcon: controller.titleValue.value
                        ? const Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green,
                    )
                        : null,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                    () => TextField(
                  minLines: 4,
                  maxLines: 7,
                  focusNode: controller.contentFocus,
                  controller: controller.contentController,
                  onChanged: (_) {
                    controller.canUpload();
                  },
                  decoration: BaseTheme.borderInputSecondary.copyWith(
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text("Isi"),
                      ),
                      hintText: "Isi Topik tidak boleh kosong",
                      suffixIcon: controller.contentValue.value
                          ? const Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                      )
                          : null),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Pilih Tag",
                style: BaseTheme.mediumText,
              ),
              const SizedBox(
                height: 20,
              ),
              const labelRow1(),
              const SizedBox(
                height: 20,
              ),
              const labelRow2(),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: Get.width,
                child: Obx(
                      () => ElevatedButton(
                    onPressed: controller.isUpload.value &&
                        controller.selectedTag.value != 0
                        ? () {
                      controller.addForum();

                    }
                        : null,
                    child: const Text("Upload Topik"),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}