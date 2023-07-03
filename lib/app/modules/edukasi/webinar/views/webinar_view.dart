import 'package:Evofly/app/builder/content_builder.dart';
import 'package:Evofly/app/routes/app_pages.dart';
import 'package:Evofly/app/services/webinar_service.dart';
import 'package:Evofly/app/widgets/back_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/webinar_controller.dart';

class WebinarView extends GetView<WebinarController> {
  const WebinarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Webinar"),
      body: GetBuilder<WebinarController>(
        initState: (_) => controller.fetchWebinar(),
        builder: (WebinarController controller) => contentBuilder(
          controller.webinars,
          futureService: WebinarService().getWebinar(),
          routes: Routes.WEBINAR,
        ),
      ),
    );
  }
}
