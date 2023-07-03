import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/base_theme.dart';
import 'edukasi_card.dart';

class CardEdukasiList extends StatelessWidget {
  const CardEdukasiList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Video",
          style: BaseTheme.mediumText.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.VIDEO),
          child: const EdukasiCard(
            desc: "Panduan, inspirasi, dan jugastrategi "
                "untuk mengembangkan "
                "usaha Anda",
            icon: FontAwesomeIcons.youtube,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "Artikel",
          style: BaseTheme.mediumText.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.ARTIKEL),
          child: const EdukasiCard(
            desc: "Tren terkini,  riset pasar, studi kasus, serta"
                " saran dan rekomendasi dalam "
                "pengembangan bisnis",
            icon: FontAwesomeIcons.newspaper,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "Webinar",
          style: BaseTheme.mediumText.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.WEBINAR),
          child: const EdukasiCard(
            desc: "Diskusi ahli, kelas online, pelatihan interaktif, "
                "dan juga pembelajaran kolaboratif terkait UMKM",
            icon: FontAwesomeIcons.desktop,
          ),
        ),
      ],
    );
  }
}
