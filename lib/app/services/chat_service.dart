import 'package:Evofly/app/modules/auth/models/user.dart';
import 'package:Evofly/app/modules/chat/room/models/message_model.dart';
import 'package:Evofly/app/modules/middleware/controllers/middleware_controller.dart';
import 'package:Evofly/app/services/base_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatService extends BaseService {
  var isMentor = Get.find<MiddlewareController>().userModel!.isMentor;

  Future<Stream<List<UserModel>>> getListUserStream() async {
    return handleFirestoreError(
      () async {
        Stream<QuerySnapshot<Map<String, dynamic>>> queryStream;
        var roomDoc = await firestore
            .collection('rooms')
            .where('mentor_id', isEqualTo: firebaseAuth.currentUser?.uid)
            .get();

        var listUid =
            roomDoc.docs.map((doc) => doc.data()['user_id'] as String).toList();

        if (isMentor) {
          queryStream = firestore
              .collection("users")
              .where("uid", whereIn: listUid)
              .snapshots();
        } else {
          queryStream = firestore
              .collection("users")
              .where("isMentor", isEqualTo: true)
              .snapshots();
        }
        return queryStream.map(
          (snapshot) => snapshot.docs
              .map((doc) => UserModel.fromJson(doc.data()))
              .toList(),
        );
      },
    );
  }

  Future<Stream<UserModel>> getUserStream(String uid) async {
    return handleFirestoreError(
      () async {
        var queryStream = firestore.collection("users").doc(uid).snapshots();

        return queryStream
            .map((snapshot) => UserModel.fromJson(snapshot.data()!));
      },
    );
  }

  Future<Stream<List<MessageModel>>> getMessageStream(String id) {
    return handleFirestoreError(
      () async {
        DocumentReference<Map<String, dynamic>> roomDoc = firestore
            .collection('rooms')
            .doc(isMentor
                ? '$id${firebaseAuth.currentUser?.uid}'
                : '${firebaseAuth.currentUser?.uid}$id');

        isMentor
            ? roomDoc.set(
                {'mentor_id': firebaseAuth.currentUser?.uid, 'user_id': id})
            : roomDoc.set(
                {'mentor_id': id, 'user_id': firebaseAuth.currentUser?.uid});

        var queryStream =
            roomDoc.collection('messages').orderBy('timestamp').snapshots();
        return queryStream.map(
          (snapshot) => snapshot.docs
              .map((doc) => MessageModel.fromJson(doc.data()))
              .toList(),
        );
      },
    );
  }

  Future<void> sendMessage(String id, String message) async {
    handleFirestoreError(() async {
      await firestore
          .collection('rooms')
          .doc(isMentor
              ? '$id${firebaseAuth.currentUser?.uid}'
              : '${firebaseAuth.currentUser?.uid}$id')
          .collection('messages')
          .add({
        'message': message,
        'sendBy': firebaseAuth.currentUser?.uid,
        'timestamp': FieldValue.serverTimestamp(),
      });
    });
  }
}
