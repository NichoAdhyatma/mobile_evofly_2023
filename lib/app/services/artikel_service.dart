import 'package:Evofly/app/modules/edukasi/artikel/models/artikel_model.dart';
import 'package:Evofly/app/services/base_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ArtikelService extends BaseService {
  Future<List<ArtikelModel>> getArtikel() async {
    final QuerySnapshot querySnapshot =
        await firestore.collection("artikel").get();

    return querySnapshot.docs.map((doc) => ArtikelModel.fromJson(doc)).toList();
  }
}
