import 'package:Evofly/app/modules/auth/models/user.dart';
import 'package:Evofly/app/modules/forum/models/forum_model.dart';
import 'package:Evofly/app/services/auth_service.dart';
import 'package:Evofly/app/services/base_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ForumService extends BaseService {
  Future<void> addForm({
    required String title,
    required String content,
    required int tag,
  }) async {
    handleFirestoreError(
      () async {
        UserModel userData =
            await AuthService().getUserData(firebaseAuth.currentUser?.uid);

        await firestore.collection('forum').add(
          {
            'title': title,
            'content': content,
            'tag': tag,
            'author': userData.name,
            'uid': firebaseAuth.currentUser?.uid,
            'timestamp': FieldValue.serverTimestamp(),
          },
        );
      },
    );
  }

  Future<List<ForumModel>> getForum() async {
    return handleFirestoreError(() async {
      var forum = await firestore.collection("forum").get();

      return forum.docs
          .map(
            (doc) => ForumModel.fromJson(doc.data()),
          )
          .toList();
    });
  }
}
