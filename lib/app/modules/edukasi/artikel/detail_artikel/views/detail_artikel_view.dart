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
      body: const Center(
        child: Text(
          'DetailArtikelView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
