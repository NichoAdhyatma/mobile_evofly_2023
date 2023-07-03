import 'package:Evofly/app/modules/edukasi/artikel/models/artikel_model.dart';
import 'package:get/get.dart';

class DetailArtikelController extends GetxController {
  ArtikelModel? artikelModel;

  initArtikel(ArtikelModel artikelModel) {
    this.artikelModel = artikelModel;
    update();
  }
}
