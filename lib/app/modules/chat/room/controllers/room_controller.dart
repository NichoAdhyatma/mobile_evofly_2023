import 'package:Evofly/app/modules/auth/models/user.dart';
import 'package:get/get.dart';

import '../../../../services/chat_service.dart';

class RoomController extends GetxController {
  Rx<UserModel> partner = Rx<UserModel>(Get.arguments as UserModel);

  void fetchChatPartnerStream() async {
    var streamMentor = await ChatService().getUserStream(partner.value.uid);
    streamMentor.listen((userModel) {
      partner.value = userModel;
    });
  }
}
