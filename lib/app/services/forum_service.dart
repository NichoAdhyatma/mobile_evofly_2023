import 'package:Evofly/app/modules/auth/models/user.dart';
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
            'timestamp': FieldValue.serverTimestamp(),
          },
        );
      },
    );
  }
}
