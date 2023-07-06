import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../themes/base_theme.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileController>(
        initState: (_) => controller.fetchUser(),
        builder: (ProfileController controller) => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
                left: 16.0,
                right: 16.0,
                bottom: 12.0,
              ),
              child: Column(
                children: [
                  TextField(
                    readOnly: true,
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      label: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: BaseTheme.whiteColor,
                          borderRadius: BorderRadius.circular(75),
                        ),
                        child: const Text("Nama"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    readOnly: true,
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      label: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: BaseTheme.whiteColor,
                          borderRadius: BorderRadius.circular(75),
                        ),
                        child: const Text("Email"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.logout();
                      },
                      child: const Text("Keluar"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
