import 'package:Evofly/app/modules/chat/room/controllers/room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'message_textfield.dart';

class SendMessage extends GetView<RoomController> {
  const SendMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Expanded(
            child: MessageTextField(),
          ),
          IconButton(
            onPressed: () {
              controller.sendMessage();
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
