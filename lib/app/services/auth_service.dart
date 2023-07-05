import 'package:Evofly/app/helper/evo_snackbar.dart';
import 'package:Evofly/app/routes/app_pages.dart';
import 'package:Evofly/app/services/base_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends BaseService {
  Future<void> register(String name, String email, String password) async {
    try {
      final UserCredential credential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      storeUser(name, credential);

      Get.offAllNamed(Routes.LAYOUT);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showErrorSnackbar(
            title: "Pesan Error", message: "Password terlalu lemah");
      } else if (e.code == 'email-already-in-use') {
        showErrorSnackbar(title: "Pesan Error", message: "Email sudah dipakai");
      }
    } catch (e) {
      showErrorSnackbar(title: "Pesan Error", message: e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Get.offAllNamed(Routes.LAYOUT);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showErrorSnackbar(
            title: "Pesan Error",
            message: "Data Yang Kamu Masukan Tidak Valid");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> storeUser(String name, UserCredential credential) async {
    firestore.collection("users").doc(credential.user!.uid).set({
      'uid': credential.user?.uid,
      'name': name,
      'email': credential.user?.email,
    });
  }
}
