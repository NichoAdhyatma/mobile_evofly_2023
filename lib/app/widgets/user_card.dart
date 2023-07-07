import 'package:Evofly/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import '../modules/auth/models/user.dart';
import '../themes/base_theme.dart';
import 'package:get/get.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.mentor,
  });

  final UserModel mentor;

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
          subtitle: mentor.status == 'online'
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
          tileColor: BaseTheme.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
