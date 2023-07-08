import 'package:Evofly/app/modules/auth/models/user.dart';
import 'package:Evofly/app/modules/chat/room/models/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../services/chat_service.dart';

class RoomController extends GetxController {
  Rx<UserModel> partner = Rx<UserModel>(Get.arguments as UserModel);
  TextEditingController messageController = TextEditingController();
  FocusNode messageFocus = FocusNode();
  RxList<MessageModel> messageList = <MessageModel>[].obs;

  void initStream() {
    fetchChatPartnerStream();
    fetchMessageStream();
  }

  void fetchChatPartnerStream() async {
    var streamMentor = await ChatService().getUserStream(partner.value.uid);
    streamMentor.listen((userModel) {
      partner.value = userModel;
    });
  }

  void fetchMessageStream() async {
    var streamMessage = await ChatService().getMessageStream(partner.value.uid);
    streamMessage.listen((messageList) {
      this.messageList.assignAll(messageList);
    });
  }

  void sendMessage() {
    var msg = messageController.text;
    messageFocus.unfocus();
    messageController.clear();
    ChatService().sendMessage(partner.value.uid, msg);
  }
}
