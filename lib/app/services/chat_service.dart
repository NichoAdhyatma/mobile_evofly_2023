import 'package:Evofly/app/modules/auth/models/user.dart';
import 'package:Evofly/app/modules/chat/room/models/message_model.dart';
import 'package:Evofly/app/modules/middleware/controllers/middleware_controller.dart';
import 'package:Evofly/app/services/base_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatService extends BaseService {
  var isMentor = Get.find<MiddlewareController>().userModel!.isMentor;


  Future<Stream<List<UserModel>>?> getListUserStream() async {
    return handleFirestoreError(
      () async {
        Stream<QuerySnapshot<Map<String, dynamic>>> queryStream;
        var userDoc = firestore.collection("users");

        if (isMentor) {
          var roomDoc = await firestore
              .collection('rooms')
              .where('mentor_id', isEqualTo: firebaseAuth.currentUser?.uid)
              .get();

          var listUid = roomDoc.docs
              .map((doc) => doc.data()['user_id'] as String)
              .toList();

          if (listUid.isNotEmpty) {
            queryStream = userDoc.where("uid", whereIn: listUid).snapshots();
          } else {
            return null;
          }
        } else {
          queryStream = userDoc.where("isMentor", isEqualTo: true).snapshots();
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

  Future<void> updateNoitfy(String id, String chatId) {
    return handleFirestoreError(() async {
      DocumentReference<Map<String, dynamic>> roomDoc = firestore
          .collection('rooms')
          .doc(isMentor
              ? '$id${firebaseAuth.currentUser?.uid}'
              : '${firebaseAuth.currentUser?.uid}$id')
          .collection("messages")
          .doc(chatId);

      return roomDoc.update({
        'notify': true,
      });
    });
  }

  Future<Stream<List<String>>> getLastMessageStream() {
    return handleFirestoreError(
      () async {
        Stream<QuerySnapshot<Map<String, dynamic>>> queryStream = firestore
            .collection('rooms')
            .where(isMentor ? 'mentor_id' : 'user_id',
                isEqualTo: firebaseAuth.currentUser?.uid)
            .snapshots();

        return queryStream.map(
          (snap) => snap.docs.map((doc) {
            if (doc.data()['last_message'] == null) {
              return "Mulai Chat";
            }
            return doc.data()['last_message'] as String;
          }).toList(),
        );
      },
    );
  }

  Future<void> sendMessage(String id, String message) async {
    handleFirestoreError(
      () async {
        var roomRef = firestore.collection('rooms').doc(isMentor
            ? '$id${firebaseAuth.currentUser?.uid}'
            : '${firebaseAuth.currentUser?.uid}$id');

        isMentor
            ? roomRef.set({
                'mentor_id': firebaseAuth.currentUser?.uid,
                'user_id': id,
                'last_message': message
              })
            : roomRef.set(
                {
                  'mentor_id': id,
                  'user_id': firebaseAuth.currentUser?.uid,
                  'last_message': message,
                },
              );

        final newMessageRef = roomRef.collection('messages').doc();
        final newMessageId = newMessageRef.id;

        final newMessageData = {
          'id': newMessageId,
          'message': message,
          'sendBy': firebaseAuth.currentUser?.uid,
          'timestamp': FieldValue.serverTimestamp(),
          'notify': false,
        };

        await newMessageRef.set(newMessageData);
      },
    );
  }
}
