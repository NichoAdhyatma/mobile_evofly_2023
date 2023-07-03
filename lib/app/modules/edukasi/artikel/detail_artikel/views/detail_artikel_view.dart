import 'package:Evofly/app/themes/base_theme.dart';
import 'package:Evofly/app/widgets/back_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_artikel_controller.dart';

class DetailArtikelView extends GetView<DetailArtikelController> {
  const DetailArtikelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Detail Artikel"),
      body: GetBuilder<DetailArtikelController>(
        initState: (_) => controller.initArtikel(Get.arguments),
        builder: (DetailArtikelController controller) => Padding(
          padding: const EdgeInsets.only(
            left: 18.0,
            right: 18.0,
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  controller.artikelModel!.title,
                  style: BaseTheme.mediumText.copyWith(
                    fontSize: 27,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Dedy Sasongko",
                style: BaseTheme.mediumText.copyWith(fontSize: 16),
              ),
              Text(
                "Senin 20 Agustus 2022, 07.00",
                style: BaseTheme.secondaryText.copyWith(fontSize: 12),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: Get.width,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(controller.artikelModel!.imageUrl),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.artikelModel!.body.length,
                itemBuilder: (BuildContext context, int index) => Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Text(controller.artikelModel!.body[index])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
