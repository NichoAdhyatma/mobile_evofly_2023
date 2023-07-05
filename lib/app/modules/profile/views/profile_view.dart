import 'package:Evofly/app/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Nama"),
                TextField(),
                ElevatedButton(
                  onPressed: () {
                    controller.logout();
                  },
                  child: const Text("Keluar"),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
