import 'package:Evofly/app/modules/chat/controllers/chat_controller.dart';
import 'package:Evofly/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import '../modules/auth/models/user.dart';
import '../themes/base_theme.dart';
import 'package:get/get.dart';

class UserCard extends GetView<ChatController> {
  const UserCard({
    super.key,
    required this.mentor,
    required this.index,
  });

  final UserModel mentor;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.ROOM, arguments: mentor),
        child: ListTile(
          contentPadding: const EdgeInsets.only(
            left: 12.0,
            right: 12.0,
          ),
          title: Text(mentor.name),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mentor.status == 'online'
                  ? Text(
                      mentor.status,
                      style: BaseTheme.mediumText
                          .copyWith(color: Colors.green[500]),
                    )
                  : Text(
                      mentor.status,
                      style: BaseTheme.mediumText
                          .copyWith(color: Colors.grey[500]),
                    ),
              Obx(
                () => Text(controller.lastMessage.length == 0
                    ? "Mulai chat"
                    : controller.lastMessage[index]),
              ),
            ],
          ),
          tileColor: BaseTheme.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
