import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../helper/evo_snackbar.dart';

class BaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseFirestore get firestore => _firestore;

  FirebaseAuth get firebaseAuth => _firebaseAuth;

  Future<T> handleFirestoreError<T>(
      Future<T> Function() firestoreOperation) async {
    try {
      return await firestoreOperation();
    } catch (e) {
      final errorMessage =
          (e is FirebaseException) ? e.message : 'Terjadi Kesalahan';
      showErrorSnackbar(title: 'Pesan Error', message: errorMessage!);
      print(errorMessage);
      return Future.value();
    }
  }

}
