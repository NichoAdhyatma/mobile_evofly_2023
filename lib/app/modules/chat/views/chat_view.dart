import 'package:Evofly/app/widgets/back_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Chat Mentor"),
      body: GetX<ChatController>(

        builder: (ChatController controller) => ListView.builder(
          itemCount: controller.mentor.length,
          itemBuilder: (BuildContext context, int index) {
            var mentor = controller.mentor[index];

            return ListTile(
              title: Text(mentor.name),
            );
          },
        ),
      ),
    );
  }
}
