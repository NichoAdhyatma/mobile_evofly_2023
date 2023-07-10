import 'package:Evofly/app/helper/compare_date.dart';
import 'package:Evofly/app/modules/middleware/controllers/middleware_controller.dart';
import 'package:Evofly/app/themes/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/message_model.dart';
import 'chat_bubble.dart';

class ListChat extends GetView<MiddlewareController> {
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
          shrinkWrap: true,
          controller: scrollController,
          itemCount: messageList.length,
          itemBuilder: (BuildContext context, int index) {
            var message = messageList[index];

            if (index == 0) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      DateFormat.MMMMEEEEd().format(message.timestamp),
                      style: BaseTheme.normalText.copyWith(
                        fontSize: 11,
                        color: BaseTheme.whiteColor,
                      ),
                    ),
                  ),
                  ChatBubble(message: message)
                ],
              );
            }
            if (compareDate(
                message.timestamp, messageList[index - 1].timestamp)) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      DateFormat.MMMMEEEEd().format(message.timestamp),
                      style: BaseTheme.normalText.copyWith(
                        fontSize: 11,
                        color: BaseTheme.whiteColor,
                      ),
                    ),
                  ),
                  ChatBubble(message: message)
                ],
              );
            }

            return ChatBubble(message: message);
          },
        ),
      ),
    );
  }
}
