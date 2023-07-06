import 'package:Evofly/app/themes/base_theme.dart';
import 'package:Evofly/app/widgets/back_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/edukasi_controller.dart';
import '../widgets/edukasi_cards_list.dart';

class EdukasiView extends GetView<EdukasiController> {
  const EdukasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Edukasi"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 32,
              left: 12,
              right: 12,
              bottom: 12
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Edukasi Bisnis",
                  style: BaseTheme.mediumText.copyWith(
                    fontSize: 32,
                  ),
                ),
                Text(
                  "Pembelajaran untuk pemilik UMKM, maupun Anda yang sedang belajar merintis bisnis.",
                  style: BaseTheme.mediumText.copyWith(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const CardEdukasiList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
