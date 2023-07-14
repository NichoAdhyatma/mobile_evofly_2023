import 'package:flutter/material.dart';

import '../../../themes/base_theme.dart';

class ForumCard extends StatelessWidget {
  const ForumCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: BaseTheme.whiteColor,
      borderRadius: BorderRadius.circular(20),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Martis Ikmal",
                  style: BaseTheme.secondaryText.copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "8 menit lalu",
                  style: BaseTheme.secondaryText.copyWith(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Bagaimana cara mengelola bisnis di sosial media untuk pemula?",
              style: BaseTheme.boldText.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Saya mempunyai bisnis keripik singkong, dan saudara saya menyarankan untuk memasarkannya lewat...",
              style: BaseTheme.secondaryText.copyWith(fontSize: 12),
            ),
            const SizedBox(
              height: 4,
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.comment_outlined,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    "7",
                    style: BaseTheme.mediumText.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}