import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/room_controller.dart';
import '../widgets/chat_appbar.dart';
import '../widgets/list_chat.dart';
import '../widgets/send_message.dart';

class RoomView extends GetView<RoomController> {
  const RoomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<RoomController>(
      initState: (_) => controller.initStream(),
      builder: (RoomController controller) => Scaffold(
        appBar: buildChatAppbar(
          name: controller.partner.value.name,
          status: controller.partner.value.status,
        ),
        body: Column(
          children: [
            ListChat(
              scrollController: controller.scrollController,
              messageList: controller.messageList,
            ),
            const SendMessage(),
          ],
        ),
      ),
    );
  }
}
