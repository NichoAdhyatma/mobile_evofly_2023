import 'package:Evofly/app/helper/pusher.dart';
import 'package:Evofly/app/modules/auth/models/user.dart';
import 'package:Evofly/app/modules/chat/room/models/message_model.dart';
import 'package:Evofly/app/modules/middleware/controllers/middleware_controller.dart';
import 'package:Evofly/app/services/base_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatService extends BaseService {
  static final MiddlewareController controller = Get.find<MiddlewareController>();
  String? name =  controller.userModel?.name;
  bool? isMentor = controller.userModel?.isMentor;

  Future<List<UserModel>> getContact() async {
    return handleFirestoreError(
      () async {
        var query = await firestore
            .collection('users')
            .where('isMentor', isEqualTo: isMentor! ? false : true)
            .get();

        return query.docs.map((e) => UserModel.fromJson(e.data())).toList();
      },
    );
  }

  Future<Stream<List<Map<String, dynamic>>>> getContactStream() async {
    return handleFirestoreError(
      () async {
        var queryStream = firestore
            .collection('rooms')
            .where(isMentor! ? 'mentor_id' : 'user_id',
                isEqualTo: firebaseAuth.currentUser?.uid)
            .snapshots();

        return queryStream
            .map((event) => event.docs.map((e) => e.data()).toList());
      },
    );
  }

  Future<Stream<List<UserModel>>?> getListUserStream() async {
    return handleFirestoreError(
      () async {
        Stream<QuerySnapshot<Map<String, dynamic>>> queryStream;
        var userDoc = firestore.collection("users");

        var roomDoc = await firestore
            .collection('rooms')
            .where(isMentor! ? 'mentor_id' : 'user_id',
                isEqualTo: firebaseAuth.currentUser?.uid)
            .get();

        var listUid = roomDoc.docs
            .map((doc) =>
                doc.data()[isMentor! ? 'user_id' : 'mentor_id'] as String)
            .toList();

        if (listUid.isNotEmpty) {
          queryStream = userDoc.where("uid", whereIn: listUid).snapshots();
        } else {
          return null;
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

  Future<Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>>
      getNotifStream() {
    return handleFirestoreError(() async {
      Stream<QuerySnapshot<Map<String, dynamic>>> queryStream = firestore
          .collection('rooms')
          .where(isMentor! ? 'mentor_id' : 'user_id',
              isEqualTo: firebaseAuth.currentUser?.uid)
          .snapshots();

      return queryStream.map((snap) => snap.docs.map((e) => e).toList());
    });
  }

  Future<Stream<List<MessageModel>>> getMessageStream(String id) {
    return handleFirestoreError(
      () async {
        DocumentReference<Map<String, dynamic>> roomDoc = firestore
            .collection('rooms')
            .doc(isMentor!
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

  Future<void> updateNoitfy(String id) {
    return handleFirestoreError(() async {
      var roomDoc = firestore.collection('rooms').doc(id);
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
            .where(isMentor! ? 'mentor_id' : 'user_id',
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
    PusherNotification().sendPushNotification(id, title: "Pesan masuk dari ${name}", body: message);

    handleFirestoreError(
      () async {
        var roomRef = firestore.collection('rooms').doc(isMentor!
            ? '$id${firebaseAuth.currentUser?.uid}'
            : '${firebaseAuth.currentUser?.uid}$id');

        isMentor!
            ? roomRef.set({
                'mentor_id': firebaseAuth.currentUser?.uid,
                'user_id': id,
                'last_message': message,
                'send_by': firebaseAuth.currentUser?.uid,
                'timestamp': FieldValue.serverTimestamp(),
                'notify': false,
              })
            : roomRef.set(
                {
                  'mentor_id': id,
                  'user_id': firebaseAuth.currentUser?.uid,
                  'last_message': message,
                  'send_by': firebaseAuth.currentUser?.uid,
                  'timestamp': FieldValue.serverTimestamp(),
                  'notify': false,
                },
              );

        final newMessageRef = roomRef.collection('messages').doc();
        final newMessageId = newMessageRef.id;

        final newMessageData = {
          'id': newMessageId,
          'message': message,
          'sendBy': firebaseAuth.currentUser?.uid,
          'timestamp': FieldValue.serverTimestamp(),
        };

        await newMessageRef.set(newMessageData);
      },
    );
  }
}
