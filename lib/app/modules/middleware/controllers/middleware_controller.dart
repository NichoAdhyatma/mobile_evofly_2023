import 'package:Evofly/app/helper/notif.dart';
import 'package:Evofly/app/modules/auth/models/user.dart';
import 'package:Evofly/app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pusher_beams/pusher_beams.dart';

import '../../../helper/evo_snackbar.dart';
import '../../../routes/app_pages.dart';

class MiddlewareController extends GetxController {
  UserModel? userModel;
  AuthService authService = AuthService();

  void authStateChange() {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) async {
        if (user == null) {
          Get.offAllNamed(Routes.LOGIN);
        } else {
          authService.updateStatusUser('online');
          var streamUser = await authService.getAuthUserStrem();
          userModel = await authService.getUserData(null);

          streamUser.listen(
            (user) {
              userModel = user;
            },
          );

          showSuccessSnackbar(
            title: "Anda telah Masuk ${userModel?.name}",
            message: "Selamat Datang di Evofly",
          );

          Notif.getStreamNotif();

          await PusherBeams.instance.setDeviceInterests([userModel!.uid]);

          Get.offAllNamed(Routes.LAYOUT);
        }
      },
    );
  }
}
