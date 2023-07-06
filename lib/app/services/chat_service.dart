import 'package:Evofly/app/modules/auth/models/user.dart';
import 'package:Evofly/app/services/auth_service.dart';
import 'package:Evofly/app/services/base_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService extends BaseService {
  Future<Stream<List<UserModel>>> getMentorStream() async {
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
}
