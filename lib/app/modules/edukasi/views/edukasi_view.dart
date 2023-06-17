import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edukasi_controller.dart';

class EdukasiView extends GetView<EdukasiController> {
  const EdukasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EdukasiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EdukasiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
