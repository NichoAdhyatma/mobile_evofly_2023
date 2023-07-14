import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forum_controller.dart';
import '../widgets/forum_card.dart';
import '../widgets/header.dart';
import '../widgets/new_post_button.dart';

class ForumView extends GetView<ForumController> {
  const ForumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Header(),
                SizedBox(
                  height: 20,
                ),
                ForumCard(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const NewPostButton(),
    );
  }
}
