import 'package:Evofly/app/services/chat_service.dart';
import 'package:get/get.dart';

import '../../auth/models/user.dart';

class ChatController extends GetxController {
  RxList<UserModel> mentor = <UserModel>[].obs;
  Rx<bool> isLoading = true.obs;

  void fetchMentorStream() async {
    var streamMentor = await ChatService().getListUserStream();
    streamMentor.listen((listUser) {
      mentor.assignAll(listUser);
      isLoading.value = false;
    });
  }
}
