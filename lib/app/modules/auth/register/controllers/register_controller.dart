import 'package:Evofly/app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get nameController => _nameController;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  void register() {
    AuthService().register(
      _nameController.text,
      _emailController.text,
      _passwordController.text,
    );
  }
}
