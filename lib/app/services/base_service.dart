import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BaseService {
   final FirebaseFirestore _firestore= FirebaseFirestore.instance;
   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

   FirebaseFirestore get firestore => _firestore;
   FirebaseAuth get firebaseAuth => _firebaseAuth;
}
