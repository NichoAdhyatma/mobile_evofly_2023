import 'package:Evofly/app/modules/forum/widgets/sorting_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themes/base_theme.dart';
import 'label_row.dart';

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
