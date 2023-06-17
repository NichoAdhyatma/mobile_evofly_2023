import 'package:flutter/material.dart';

import 'evo_card.dart';

class HomeCardList extends StatelessWidget {
  const HomeCardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: EvoCard(
            title: 'Content Creator',
            imageUrl: 'assets/images/content_creator.png',
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Flexible(
          flex: 1,
          child: EvoCard(
            title: 'Edukasi Bisnis',
            imageUrl: 'assets/images/edukasi.png',
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Flexible(
          flex: 1,
          child: EvoCard(
            title: 'Chat dengan Mentor',
            imageUrl: 'assets/images/chat_mentor.png',
          ),
        ),
      ],
    );
  }
}
