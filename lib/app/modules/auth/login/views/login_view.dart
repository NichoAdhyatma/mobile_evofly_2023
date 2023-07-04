import 'package:Evofly/app/themes/base_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 20.0,
                bottom: 10.0,
              ),
              child: Column(
                children: [
                  Text(
                    "Masuk ke Akun Evofly",
                    style: BaseTheme.mediumText.copyWith(fontSize: 27),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
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
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red[500],
                                  ),
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
                                : "* Wajib diisi alamat email yang valid ",
                            style: BaseTheme.mediumText.copyWith(
                              fontWeight: FontWeight.w400,
                              color: BaseTheme.secondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.passwordController,
                          focusNode: controller.passwordFocus,
                          obscureText: true,
                          onEditingComplete: () => controller.login(
                            controller.emailController.text,
                            controller.passwordController.text,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.key),
                            hintText: "Isi Kata Sandi disini",
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
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red[500],
                                  ),
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
                                : "* Kata sandi wajib di isi ",
                            style: BaseTheme.mediumText.copyWith(
                              fontWeight: FontWeight.w400,
                              color: BaseTheme.secondaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: controller.buttonLogin.value ||
                                !controller.isDataValid()
                            ? null
                            : () {
                                controller.login(
                                  controller.emailController.text,
                                  controller.passwordController.text,
                                );
                              },
                        child: controller.buttonLogin.value
                            ? LoadingAnimationWidget.dotsTriangle(
                                size: 20,
                                color: BaseTheme.whiteColor,
                              )
                            : const Text("Masuk"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
