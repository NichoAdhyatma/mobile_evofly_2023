import 'package:Evofly/app/modules/forum/controllers/forum_controller.dart';
import 'package:Evofly/app/modules/forum/widgets/label_row.dart';
import 'package:Evofly/app/themes/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPostButton extends GetView<ForumController> {
  const NewPostButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    controller.setSelectedTag(0);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
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
                              ? () {}
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
        ).whenComplete(() {
          controller.titleController.clear();
          controller.contentController.clear();

          controller.contentValue.value = false;
          controller.titleValue.value = false;

          controller.setSelectedTag(0);
        });
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add),
          Text("Posting"),
        ],
      ),
    );
  }
}
