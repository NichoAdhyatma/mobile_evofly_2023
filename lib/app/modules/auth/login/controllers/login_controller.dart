import 'package:Evofly/app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Rx<bool> buttonLogin = false.obs;
  final Rx<bool> emailData = false.obs;
  final Rx<bool> passwordData = false.obs;
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    emailController.addListener(() {
      if (emailController.text.isNotEmpty && emailController.text.isEmail) {
        emailData.value = true;
      } else {
        emailData.value = false;
      }
    });

    passwordController.addListener(() {
      if (passwordController.text.isNotEmpty) {
        passwordData.value = true;
      } else {
        passwordData.value = false;
      }
    });
    super.onInit();
  }

  Future<void> login() async {
    unfocusAll();

    if (isDataValid()) {
      setButtonLogin(true);
      await AuthService()
          .login(_emailController.text, _passwordController.text)
          .whenComplete(() => setButtonLogin(false));
    }
  }

  void setButtonLogin(bool val) {
    buttonLogin.value = val;
  }

  bool isDataValid() {
    return emailData.value && passwordData.value;
  }

  void unfocusAll() {
    emailFocus.unfocus();
    passwordFocus.unfocus();
  }
}
