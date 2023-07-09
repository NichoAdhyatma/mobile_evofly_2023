import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/message_model.dart';
import 'chat_bubble.dart';

class ListChat extends StatelessWidget {
  const ListChat({
    required this.messageList,
    super.key,
    required this.scrollController,
  });

  final RxList<MessageModel> messageList;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: ListView.builder(
          controller: scrollController,
          itemCount: messageList.length,
          itemBuilder: (BuildContext context, int index) {
            var message = messageList[index];
            return ChatBubble(message: message);
          },
        ),
      ),
    );
  }
}
