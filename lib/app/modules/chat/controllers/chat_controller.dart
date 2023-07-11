import 'package:Evofly/app/services/chat_service.dart';
import 'package:get/get.dart';

import '../../auth/models/user.dart';

class ChatController extends GetxController {
  RxList<UserModel> mentor = <UserModel>[].obs;
  RxList<String> lastMessage = <String>[].obs;
  var tes = "".obs;
  Rx<bool> isLoading = true.obs;

  Future<void> initStream() async {
    await fetchLastMessageStream();
    await fetchPartnerStream();
  }

  Future<void> fetchLastMessageStream() async {
    var streamLastMsg = await ChatService().getLastMessageStream();

    streamLastMsg.listen((listMsg) {
      lastMessage.assignAll(listMsg);
    });
  }

  Future<void> fetchPartnerStream() async {
    var streamMentor = await ChatService()
        .getListUserStream()
        .whenComplete(() => isLoading.value = false);

    streamMentor?.listen((listUser) {
      mentor.assignAll(listUser);
    });
  }
}
