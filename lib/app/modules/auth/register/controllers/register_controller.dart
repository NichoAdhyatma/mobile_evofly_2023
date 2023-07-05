import 'package:Evofly/app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Rx<bool> buttonLogin = false.obs;
  final Rx<bool> emailData = false.obs;
  final Rx<bool> passwordData = false.obs;
  final Rx<bool> nameData = false.obs;
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode nameFocus = FocusNode();

  TextEditingController get nameController => _nameController;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  @override
  void onClose() {
    _emailController.dispose();
    _passwordController.dispose();
    emailFocus.dispose();
    nameFocus.dispose();
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
      if (passwordController.text.length >= 8) {
        passwordData.value = true;
      } else {
        passwordData.value = false;
      }
    });

    nameController.addListener(() {
      if (nameController.text.length >= 4) {
        nameData.value = true;
      } else {
        nameData.value = false;
      }
    });
    super.onInit();
  }

  void register() {
    unfocusAll();
    if (isDataValid()) {
      setButtonLogin(true);
      AuthService()
          .register(
            _nameController.text,
            _emailController.text,
            _passwordController.text,
          )
          .whenComplete(
            () => setButtonLogin(false),
          );
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
    nameFocus.unfocus();
  }
}
