import 'package:Evofly/app/services/chat_service.dart';
import 'package:get/get.dart';

import '../../auth/models/user.dart';

class ChatController extends GetxController {
  RxList<UserModel> mentor = <UserModel>[].obs;
  List<UserModel> contact = [];
  RxList<String> lastMessage = <String>[].obs;
  var tes = "".obs;
  Rx<bool> isLoading = true.obs;

  Future<void> initStream() async {
    await fetchLastMessageStream();
    await fetchPartnerStream();
    await fetchContactStream();
  }

  Future<void> fetchContactStream() async {
    var stream = await ChatService().getContactStream();

    stream.listen((event) {
      fetchPartnerStream();
    });
  }

  Future<void> fetchContact() async {
    var listContact = await ChatService().getContact();
    if (listContact.isNotEmpty) {
      contact.assignAll(listContact);
      update();
    }
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
