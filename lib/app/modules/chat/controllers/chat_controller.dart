import 'package:Evofly/app/services/chat_service.dart';
import 'package:get/get.dart';

import '../../auth/models/user.dart';

class ChatController extends GetxController {
  List<UserModel> mentor = [];

  void fetchMentor() {
    ChatService().getMentor().then(
          (listUser) => mentor.addAll(listUser),
        );
  }
}
