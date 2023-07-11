import 'package:Evofly/app/services/auth_service.dart';
import 'package:get/get.dart';

class AppLifeCycleController extends FullLifeCycleController with FullLifeCycleMixin {
  final AuthService authService = AuthService();

  @override
  void onDetached() {
    authService.updateStatusUser('offline');
  }

  @override
  void onInactive() {
    authService.updateStatusUser('offline');
  }

  @override
  void onPaused() {
    authService.updateStatusUser('offline');
  }

  @override
  void onResumed() {
    // Called when the app is resumed
    authService.updateStatusUser('online');
  }
}
