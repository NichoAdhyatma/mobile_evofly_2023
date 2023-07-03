import 'package:Evofly/app/modules/edukasi/webinar/models/webinar_model.dart';
import 'package:get/get.dart';

class DetailWebinarController extends GetxController {
  WebinarModel? webinar;

  void initWebinar(WebinarModel webinarModel) {
    webinar = webinarModel;
    update();
  }

}
