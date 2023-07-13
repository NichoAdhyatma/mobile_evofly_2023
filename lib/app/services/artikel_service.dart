import 'package:Evofly/app/modules/edukasi/artikel/models/artikel_model.dart';
import 'package:Evofly/app/services/base_service.dart';

class ArtikelService extends BaseService {
  Future<List<ArtikelModel>> getArtikel() async {
    return handleFirestoreError<List<ArtikelModel>>(
      () async {
        final querySnapshot = await firestore.collection("artikel").get();

        return querySnapshot.docs
            .map(
              (doc) => ArtikelModel.fromJson(
                doc.data(),
              ),
            )
            .toList();
      },
    );
  }
}
