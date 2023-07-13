import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forum_controller.dart';

class ForumView extends GetView<ForumController> {
  const ForumView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForumView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ForumView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
