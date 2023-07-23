import 'package:Evofly/app/const/labe_list.dart';
import 'package:Evofly/app/modules/forum/models/forum_model.dart';
import 'package:Evofly/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../themes/base_theme.dart';
import 'label_tag.dart';

class ForumCard extends StatelessWidget {
  const ForumCard({
    super.key,
    required this.forumModel,
  });

  final ForumModel forumModel;

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
                LabelTag(
                  text: labelList[forumModel.tag - 1],
                  id: 0,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  forumModel.uid == AuthService().firebaseAuth.currentUser?.uid
                      ? "You"
                      : forumModel.author,
                  style: BaseTheme.mediumText.copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  timeago.format(forumModel.timestamp, locale: 'id_ID'),
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
              forumModel.title,
              style: BaseTheme.boldText.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              forumModel.content,
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
