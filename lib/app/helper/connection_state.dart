import 'package:Evofly/app/helper/evo_snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectionState extends GetxController {
  Rx<ConnectivityResult>? connectionState;

  @override
  void onInit() {
    connectionStream();
    super.onInit();
  }

  void connectionStream() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionState?.value = result;
      if (result == ConnectivityResult.none) {
        showErrorSnackbar(
            title: "Koneksi internet tidak ada",
            message: "Koneksi Internet hilang");
      } else {
        showSuccessSnackbar(
            title: "Terhubung ke interenet", message: "Kembali Online");
      }
    });
  }
}
