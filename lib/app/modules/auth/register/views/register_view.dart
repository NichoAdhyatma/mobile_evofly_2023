import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
          child: Column(
            children: [
              Text(
                "Daftar Akun Evofly",
                style: BaseTheme.mediumText.copyWith(fontSize: 27),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: controller.nameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  hintText: "Nama Lengkap",
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
                height: 25,
              ),
              TextField(
                controller: controller.emailController,
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
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
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
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () {
                    controller.register();
                  },
                  child: const Text("Daftar"),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
