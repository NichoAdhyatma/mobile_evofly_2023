import 'package:Evofly/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'evo_card.dart';

class HomeCardList extends StatelessWidget {
  const HomeCardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          flex: 1,
          child: EvoCard(
            title: 'Layanan UMKM',
            imageUrl: 'assets/images/content_creator.png',
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Flexible(
          flex: 1,
          child: GestureDetector(
            onTap: () => Get.toNamed(Routes.EDUKASI),
            child: const EvoCard(
              title: 'Edukasi Bisnis',
              imageUrl: 'assets/images/edukasi.png',
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Flexible(
          flex: 1,
          child: GestureDetector(
            onTap: () => Get.toNamed(Routes.CHAT),
            child: const EvoCard(
              title: 'Chat dengan Mentor',
              imageUrl: 'assets/images/chat_mentor.png',
            ),
          ),
        ),
      ],
    );
  }
}
