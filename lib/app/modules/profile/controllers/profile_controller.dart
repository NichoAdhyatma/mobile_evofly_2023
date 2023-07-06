import 'package:Evofly/app/modules/auth/models/user.dart';
import 'package:Evofly/app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void logout() {
    AuthService().signOut();
  }

  Future<void> fetchUser() async {
    UserModel userModel = await AuthService().getUserData();
    nameController.text = userModel.name;
    emailController.text = userModel.email;
  }
}
