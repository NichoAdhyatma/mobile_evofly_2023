import 'package:Evofly/app/modules/auth/models/user.dart';
import 'package:Evofly/app/modules/chat/room/models/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../services/chat_service.dart';

class RoomController extends GetxController {
  Rx<UserModel> partner = Rx<UserModel>(Get.arguments as UserModel);
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  FocusNode messageFocus = FocusNode();
  RxList<MessageModel> messageList = <MessageModel>[].obs;

  void initStream() {
    fetchChatPartnerStream();
    fetchMessageStream();

    messageController.addListener(() {
      scrollToEnd();
    });
  }

  @override
  void onClose() {
    messageFocus.dispose();
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void fetchChatPartnerStream() async {
    var streamMentor = await ChatService().getUserStream(partner.value.uid);
    streamMentor.listen(
      (userModel) {
        partner.value = userModel;
      },
    );
  }

  void fetchMessageStream() async {
    var streamMessage = await ChatService().getMessageStream(partner.value.uid);
    streamMessage.listen((messageList) async {
      this.messageList.assignAll(messageList);

      scrollToEnd();
    });
  }

  void scrollToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 100,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeIn,
        );
      }
    });
  }

  void sendMessage() {
    var msg = messageController.text;
    messageFocus.unfocus();
    messageController.clear();
    ChatService().sendMessage(partner.value.uid, msg);
  }
}
