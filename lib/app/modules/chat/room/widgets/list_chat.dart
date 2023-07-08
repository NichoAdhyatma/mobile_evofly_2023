import 'package:Evofly/app/modules/chat/room/controllers/room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_bubble.dart';

class ListChat extends GetView<RoomController> {
  const ListChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.messageList.length,
        itemBuilder: (BuildContext context, int index) {
          var message = controller.messageList[index];
          return ChatBubble(message: message);
        },
      ),
    );
  }
}