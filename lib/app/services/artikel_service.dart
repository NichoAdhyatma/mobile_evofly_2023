import 'package:Evofly/app/modules/edukasi/artikel/models/artikel_model.dart';
import 'package:Evofly/app/services/base_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ArtikelService extends BaseService {
  Future<List<ArtikelModel>> getArtikel() async {
    QuerySnapshot document = await firestore.collection("artikel").get();

    List<ArtikelModel> listArtikelModel = [];

    for (var doc in document.docs) {
      listArtikelModel.add(ArtikelModel.fromJson(doc));
    }

    return listArtikelModel;
  }
}