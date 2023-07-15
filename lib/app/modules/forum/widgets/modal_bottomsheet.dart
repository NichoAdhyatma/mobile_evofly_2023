import 'package:Evofly/app/modules/forum/widgets/label_tag.dart';
import 'package:Evofly/app/modules/forum/widgets/sorting_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themes/base_theme.dart';

Future<dynamic> buildModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: Get.width,
          color: BaseTheme.semidark,
          child: Text(
            "Sorting dan Tag",
            style: BaseTheme.mediumText.copyWith(
              color: BaseTheme.whiteColor,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: BaseTheme.greyDark,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sorting Berdasarkan",
                        style: BaseTheme.boldText.copyWith(
                          color: BaseTheme.whiteColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SortingCheckBox(
                        id: 0,
                        text: "Postingan Terbaru",
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const SortingCheckBox(
                        id: 1,
                        text: "Postingan Terlama",
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Text(
                        "Filter Berdasarkan Tag",
                        style: BaseTheme.boldText.copyWith(
                          color: BaseTheme.whiteColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LabelTag(id: 1, text: "Social Media"),
                          LabelTag(id: 2, text: "Inovasi"),
                          LabelTag(id: 3, text: "Keuangan"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LabelTag(id: 4, text: "Bisnis"),
                          LabelTag(id: 5, text: "Digital Marketing"),
                          LabelTag(id: 6, text: "Teknologi"),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("Tampilkan Postingan"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Hapus Semua",
                            style: BaseTheme.mediumText.copyWith(
                              color: BaseTheme.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
