import 'package:Evofly/app/themes/base_theme.dart';
import 'package:Evofly/app/widgets/back_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_webinar_controller.dart';

class DetailWebinarView extends GetView<DetailWebinarController> {
  const DetailWebinarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Detail Webinar"),
      body: GetBuilder<DetailWebinarController>(
        initState: (_) => controller.initWebinar(Get.arguments),
        builder: (DetailWebinarController controller) => Padding(
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
            top: 20,
          ),
          child: ListView(
            children: [
              Text(
                controller.webinar!.title,
                style: BaseTheme.mediumText.copyWith(
                  fontSize: 27,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Online Zoom",
                style: BaseTheme.mediumText.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "05 Mei 2023 10.13",
                style: BaseTheme.secondaryText.copyWith(fontSize: 13),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: Get.width,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(controller.webinar!.imageUrl),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                controller.webinar!.body,
                style: BaseTheme.secondaryText.copyWith(fontSize: 13),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Daftar"),
        ),
      ),
    );
  }
}
