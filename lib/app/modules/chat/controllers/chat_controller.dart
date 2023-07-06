import 'package:Evofly/app/services/chat_service.dart';
import 'package:get/get.dart';

import '../../auth/models/user.dart';

class ChatController extends GetxController {
  RxList<UserModel> mentor = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMentorStream();
  }

  void fetchMentorStream() async {
    var streamMentor = await ChatService().getMentorStream();
    streamMentor.listen((listUser) {
      mentor.assignAll(listUser);
    });
  }
}
