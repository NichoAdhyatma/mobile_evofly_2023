import 'package:Evofly/app/services/artikel_service.dart';
import 'package:get/get.dart';

import '../models/artikel_model.dart';

class ArtikelController extends GetxController {
  final List<ArtikelModel> artikels = [];

  void fetchArtikel() {
    artikels.clear();
    ArtikelService().getArtikel().then(
      (artikelList) {
        artikels.addAll(artikelList);
      },
    );
  }
}
