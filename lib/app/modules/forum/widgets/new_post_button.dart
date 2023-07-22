import 'package:Evofly/app/modules/forum/controllers/forum_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'new_forum_modal.dart';

class NewPostButton extends GetView<ForumController> {
  const NewPostButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    controller.setSelectedTag(0);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
      ),
      onPressed: () {
        buildAddForumModal(context, controller).whenComplete(() {
          controller.titleController.clear();
          controller.contentController.clear();

          controller.contentValue.value = false;
          controller.titleValue.value = false;

          controller.setSelectedTag(0);
        });
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add),
          Text("Posting"),
        ],
      ),
    );
  }
}
