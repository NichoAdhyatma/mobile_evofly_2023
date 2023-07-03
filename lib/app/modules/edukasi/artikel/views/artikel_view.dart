import 'package:Evofly/app/builder/content_builder.dart';
import 'package:Evofly/app/routes/app_pages.dart';
import 'package:Evofly/app/services/artikel_service.dart';
import 'package:Evofly/app/widgets/back_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/artikel_controller.dart';

class ArtikelView extends GetView<ArtikelController> {
  const ArtikelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Artikel"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GetBuilder<ArtikelController>(
          initState: (_) => controller.fetchArtikel(),
          builder: (ArtikelController controller) => contentBuilder(
            controller.artikels,
            futureService: ArtikelService().getArtikel(),
            routes: Routes.DETAIL_ARTIKEL,
          ),
        ),
      ),
    );
  }
}
