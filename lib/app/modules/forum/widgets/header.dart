import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/base_theme.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Forum',
          style: BaseTheme.mediumText.copyWith(
            fontSize: 25,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            backgroundColor: BaseTheme.semidark,
          ),
          onPressed: () {
            showModalBottomSheet(
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Postingan Terbaru",
                                      style: BaseTheme.mediumText.copyWith(
                                        color: BaseTheme.whiteColor.withOpacity(
                                          0.8,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                      value: true,
                                      onChanged: (bool? value) {},
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Postingan Terlama",
                                      style: BaseTheme.mediumText.copyWith(
                                        color: BaseTheme.whiteColor.withOpacity(
                                          0.8,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                      value: false,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      onChanged: (bool? value) {},
                                    ),
                                  ],
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 2.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: BaseTheme.semidark,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "Social Media",
                                        style: BaseTheme.mediumText.copyWith(
                                          color: BaseTheme.whiteColor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 2.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: BaseTheme.semidark,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "Social Media",
                                        style: BaseTheme.mediumText.copyWith(
                                          color: BaseTheme.whiteColor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 2.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: BaseTheme.semidark,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "Social Media",
                                        style: BaseTheme.mediumText.copyWith(
                                          color: BaseTheme.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 2.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: BaseTheme.semidark,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "Social Media",
                                        style: BaseTheme.mediumText.copyWith(
                                          color: BaseTheme.whiteColor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 2.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: BaseTheme.semidark,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "Social Media",
                                        style: BaseTheme.mediumText.copyWith(
                                          color: BaseTheme.whiteColor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 2.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: BaseTheme.semidark,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "Social Media",
                                        style: BaseTheme.mediumText.copyWith(
                                          color: BaseTheme.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  width: Get.width,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Tampilkan Postingan"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: Get.width,
                                  child: TextButton(
                                    onPressed: () {},
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
          },
          child: Row(
            children: [
              Text(
                "Sorting dan Tag",
                style: BaseTheme.mediumText.copyWith(
                  color: BaseTheme.whiteColor,
                  fontSize: 15,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
