import 'package:Evofly/app/helper/evo_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

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

  Future<void> login(String email, String password) async {
    unfocusAll();
    setButtonLogin(true);
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(
            () => setButtonLogin(false),
          );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        showErrorSnackbar(
            title: "Pesan Error",
            message: "Data Yang Kamu Masukan Tidak Valid");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
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
