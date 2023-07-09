import 'package:Evofly/app/modules/auth/models/user.dart';
import 'package:Evofly/app/modules/chat/room/models/message_model.dart';
import 'package:Evofly/app/services/auth_service.dart';
import 'package:Evofly/app/services/base_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService extends BaseService {
  Future<Stream<List<UserModel>>> getListUserStream() async {
    var userData = await AuthService().getUserData();
    Stream<QuerySnapshot<Map<String, dynamic>>> queryStream;

    return handleFirestoreError(
      () async {
        if (userData.isMentor) {
          queryStream = firestore
              .collection("users")
              .where("isMentor", isEqualTo: false)
              .snapshots();
        } else {
          queryStream = firestore
              .collection("users")
              .where("isMentor", isEqualTo: true)
              .snapshots();
        }
        var stream = queryStream.map(
          (snapshot) =>
              snapshot.docs.map((doc) => UserModel.fromJson(doc)).toList(),
        );

        return stream;
      },
    );
  }

  Future<Stream<UserModel>> getUserStream(String uid) async {
    return handleFirestoreError(() async {
      var queryStream = firestore.collection("users").doc(uid).snapshots();
      var userModel =
          queryStream.map((snapshot) => UserModel.fromJson(snapshot));

      return userModel;
    });
  }

  Future<Stream<List<MessageModel>>> getMessageStream(String id) {
    return handleFirestoreError(() async {
      var userData = await AuthService().getUserData();

      DocumentReference<Map<String, dynamic>> roomDoc = firestore
          .collection('rooms')
          .doc(!userData.isMentor
              ? '${firebaseAuth.currentUser?.uid}$id'
              : '$id${firebaseAuth.currentUser?.uid}');

      roomDoc.set({
        'mentor_id': id,
      });

      var queryStream =
          roomDoc.collection('messages').orderBy('timestamp').snapshots();
      var stream = queryStream.map(
        (snapshot) =>
            snapshot.docs.map((doc) => MessageModel.fromJson(doc)).toList(),
      );

      return stream;
    });
  }

  Future<void> sendMessage(String id, String message) async {
    handleFirestoreError(() async {
      await firestore
          .collection('rooms')
          .doc('${firebaseAuth.currentUser!.uid}$id')
          .collection('messages')
          .add({
        'message': message,
        'sendBy': firebaseAuth.currentUser?.uid,
        'timestamp': FieldValue.serverTimestamp(),
      });
    });
  }
}
