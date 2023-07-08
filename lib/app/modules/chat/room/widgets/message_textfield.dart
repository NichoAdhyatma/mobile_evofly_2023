import 'package:Evofly/app/modules/chat/room/controllers/room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageTextField extends GetView<RoomController> {
  const MessageTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: controller.messageFocus,
      controller: controller.messageController,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        counter: const Offstage(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
      minLines: 1,
      maxLines: 5,
      maxLength: 255,
    );
  }
}
