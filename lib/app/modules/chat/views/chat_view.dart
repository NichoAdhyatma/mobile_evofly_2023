import 'package:Evofly/app/services/chat_service.dart';
import 'package:Evofly/app/widgets/back_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/skeleton_cards.dart';
import '../../../widgets/user_card.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Chat Mentor"),
      body: GetX(
        initState: (_) => controller.fetchMentorStream(),
        builder: (ChatController controller) => controller.isLoading.value
            ? const SkeletonCardList(
                count: 6,
              )
            : ListView.builder(
                itemCount: controller.mentor.length,
                itemBuilder: (BuildContext context, int index) {
                  var mentor = controller.mentor[index];
                  return UserCard(mentor: mentor);
                },
              ),
      ),
    );
  }
}
