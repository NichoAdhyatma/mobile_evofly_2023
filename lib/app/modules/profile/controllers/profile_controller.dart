import 'package:Evofly/app/services/auth_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
   void logout() {
      AuthService().signOut();
   }
}
