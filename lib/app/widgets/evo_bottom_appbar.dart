import 'package:Evofly/app/modules/home/controllers/home_controller.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/app_theme.dart';

class EvoBottomBar extends StatelessWidget{
  const EvoBottomBar({
    super.key,
    required this.controller
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Padding(
        padding: const EdgeInsets.all(16.0),
        child: BottomBarSalomon(
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              spreadRadius: 1.0,
              blurStyle: BlurStyle.outer,
              blurRadius: 1.0,
              offset: Offset(0.2, 0.2),
            )
          ],
          items: const [
            TabItem(
              icon: Icons.home_outlined,
              title: 'Beranda',
            ),
            TabItem(
              icon: Icons.work_history_outlined,
              title: 'Riwayat',
            ),
            TabItem(
              icon: Icons.person_outline_rounded,
              title: 'Akun',
            ),
          ],
          heightItem: 40,
          iconSize: 28,
          titleStyle: const TextStyle(fontSize: 12),
          color: ThemeConfig.secondaryColor,
          backgroundColor: ThemeConfig.primaryColor,
          colorSelected: ThemeConfig.primaryColor,
          backgroundSelected: ThemeConfig.secondaryColor,
          borderRadius: BorderRadius.circular(20),
          indexSelected: controller.visit.value,
          onTap: (index) => controller.changeVisit(index),
        ),
      ),
    );
  }
}