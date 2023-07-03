import 'package:Evofly/app/services/webinar_service.dart';
import 'package:get/get.dart';

import '../models/webinar_model.dart';

class WebinarController extends GetxController {
  List<WebinarModel> webinars = [];

  void fetchWebinar() {
    webinars.clear();
    WebinarService().getWebinar().then((webinarList) {
      webinars.addAll(webinarList);
      update();
    });
  }
}
