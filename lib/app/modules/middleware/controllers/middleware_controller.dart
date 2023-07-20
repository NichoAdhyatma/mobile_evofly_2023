import 'package:Evofly/app/helper/notif.dart';
import 'package:Evofly/app/modules/auth/models/user.dart';
import 'package:Evofly/app/services/auth_service.dart';
import 'package:Evofly/app/services/base_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../helper/evo_snackbar.dart';
import '../../../routes/app_pages.dart';

class MiddlewareController extends GetxController {
  UserModel? userModel;

  void authStateChange() {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) async {
        if (user == null) {
          Get.offAllNamed(Routes.LOGIN);
        } else {
          AuthService().updateStatusUser('online');
          var streamUser = await AuthService().getAuthUserStrem();
          userModel = await AuthService().getUserData(null);

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

          Get.offAllNamed(Routes.LAYOUT);
        }
      },
    );
  }
}
