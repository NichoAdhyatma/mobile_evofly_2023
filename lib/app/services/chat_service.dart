import 'package:Evofly/app/modules/auth/models/user.dart';
import 'package:Evofly/app/services/base_service.dart';

class ChatService extends BaseService {
  Future<List<UserModel>> getMentor() async {
    return handleFirestoreError(
      () async {
        var data = await firestore
            .collection("users")
            .where("isMentor", isEqualTo: true)
            .get();
        return data.docs.map((doc) => UserModel.fromJson(doc)).toList();
      },
    );
  }
}
