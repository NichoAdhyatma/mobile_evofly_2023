import 'package:Evofly/app/helper/evo_snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionState extends GetxController {
  @override
  void onInit() {
    connectionStream();
    super.onInit();
  }

  void connectionStream() {
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
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

  Future<bool> isConnected() async {
    return await InternetConnectionChecker().hasConnection;
  }
}
