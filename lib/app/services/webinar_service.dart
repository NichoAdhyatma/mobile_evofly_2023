import 'package:Evofly/app/helper/evo_snackbar.dart';
import 'package:Evofly/app/modules/edukasi/webinar/models/webinar_model.dart';
import 'package:Evofly/app/services/base_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WebinarService extends BaseService {
  Future<List<WebinarModel>> getWebinar() async {
    return handleFirestoreError<List<WebinarModel>>(
      () async {
        final querySnapshot = await firestore.collection('webinar').get();
        return querySnapshot.docs
            .map((doc) => WebinarModel.fromJson(doc))
            .toList();
      },
    );
  }
}
