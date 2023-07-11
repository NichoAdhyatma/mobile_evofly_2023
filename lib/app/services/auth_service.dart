import 'package:Evofly/app/helper/evo_snackbar.dart';
import 'package:Evofly/app/services/base_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../modules/auth/models/user.dart';

class AuthService extends BaseService {
  Future<void> register(String name, String email, String password) async {
    try {
      final UserCredential credential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      storeUser(name, credential);
      updateStatusUser("online");
    } catch (e) {
      handleFirebaseAuthError(e);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      updateStatusUser("online");
    } catch (e) {
      handleFirebaseAuthError(e);
    }
  }

  void handleFirebaseAuthError(dynamic error) {
    if (error is FirebaseAuthException) {
      final code = error.code;
      if (code == 'weak-password') {
        showErrorSnackbar(
            title: "Pesan Error", message: "Password terlalu lemah");
      } else if (code == 'email-already-in-use') {
        showErrorSnackbar(title: "Pesan Error", message: "Email sudah dipakai");
      } else {
        showErrorSnackbar(
            title: "Pesan Error",
            message: "Data yang Anda masukkan tidak valid");
      }
    } else {
      showErrorSnackbar(title: "Pesan Error", message: "Terjadi kesalahan");
    }
  }

  Future<void> signOut() async {
    handleFirestoreError(() async {
      updateStatusUser("offline").then((_) => firebaseAuth.signOut());
    });
  }

  Future<UserModel> getUserData() async {
    return handleFirestoreError(() async {
      var user = await firestore
          .collection('users')
          .doc(firebaseAuth.currentUser?.uid)
          .get();

      return UserModel.fromJson(user.data()!);
    });
  }

  Future<void> storeUser(String name, UserCredential credential) async {
    firestore.collection("users").doc(credential.user!.uid).set({
      'uid': credential.user?.uid,
      'name': name,
      'email': credential.user?.email,
      'status': 'offline',
      'isMentor': false,
    });
  }

  Future<void> updateStatusUser(String status) async {
    await firestore
        .collection('users')
        .doc(firebaseAuth.currentUser?.uid)
        .update({'status': status});
  }

  Future<Stream<UserModel>> getAuthUserStrem() {
    return handleFirestoreError(() async {
      var queryStream = firestore
          .collection('users')
          .doc(firebaseAuth.currentUser?.uid)
          .snapshots();
      var userModel = queryStream.map(
        (doc) => UserModel.fromJson(doc.data()!),
      );

      return userModel;
    });
  }
}
