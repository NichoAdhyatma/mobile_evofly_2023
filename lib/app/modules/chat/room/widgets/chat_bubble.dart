import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../themes/base_theme.dart';
import '../models/message_model.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: BaseTheme.secondaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            constraints: BoxConstraints(
              maxWidth: Get.width * 0.8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              // Set mainAxisSize to min
              children: [
                Flexible(
                  child: Text(
                    message.message,
                    style: BaseTheme.mediumText.copyWith(
                      color: BaseTheme.whiteColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  DateFormat.Hm().format(message.timestamp),
                  style: BaseTheme.secondaryText.copyWith(
                    color: Colors.grey[400],
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}