import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../themes/base_theme.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 20.0,
            bottom: 10.0,
          ),
          child: Obx(
            () => Column(
              children: [
                Text(
                  "Daftar Akun Evofly",
                  style: BaseTheme.mediumText.copyWith(fontSize: 27),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: controller.nameController,
                      focusNode: controller.nameFocus,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: "Nama Lengkap",
                        label: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: BaseTheme.whiteColor,
                            borderRadius: BorderRadius.circular(75),
                          ),
                          child: const Text("Nama"),
                        ),
                        suffixIcon: controller.nameData.value
                            ? Icon(
                                Icons.check_circle_rounded,
                                color: Colors.green[500],
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        controller.nameData.value
                            ? ""
                            : "* Wajib diisi dan minimal berisi 4 karakter ",
                        style: BaseTheme.mediumText.copyWith(
                          fontSize: 11,
                          color: BaseTheme.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: controller.emailController,
                      focusNode: controller.emailFocus,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: "contoh : nama@gmail.com",
                        label: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: BaseTheme.whiteColor,
                            borderRadius: BorderRadius.circular(75),
                          ),
                          child: const Text("Email"),
                        ),
                        suffixIcon: controller.emailData.value
                            ? Icon(
                                Icons.check_circle_rounded,
                                color: Colors.green[500],
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        controller.emailData.value
                            ? ""
                            : "* Wajib diisi dengan email yang valid",
                        style: BaseTheme.mediumText.copyWith(
                          fontSize: 11,
                          color: BaseTheme.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      focusNode: controller.passwordFocus,
                      controller: controller.passwordController,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key),
                        hintText: "Kata Sandi 8 digit",
                        label: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: BaseTheme.whiteColor,
                            borderRadius: BorderRadius.circular(75),
                          ),
                          child: const Text("Kata Sandi"),
                        ),
                        suffixIcon: controller.passwordData.value
                            ? Icon(
                                Icons.check_circle_rounded,
                                color: Colors.green[500],
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        controller.passwordData.value
                            ? ""
                            : "* Wajib diisi dengan kata sandi minimal 8 karakter",
                        style: BaseTheme.mediumText.copyWith(
                          fontSize: 11,
                          color: BaseTheme.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: !controller.isDataValid() ||
                            controller.buttonLogin.value
                        ? null
                        : () {
                            controller.register();
                          },
                    child: controller.buttonLogin.value
                        ? LoadingAnimationWidget.dotsTriangle(
                            color: BaseTheme.whiteColor,
                            size: 20,
                          )
                        : const Text("Daftar"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah punya akun ?"),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "Masuk",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
