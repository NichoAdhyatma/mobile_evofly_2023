import 'package:Evofly/app/themes/base_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../controllers/middleware_controller.dart';

class MiddlewareView extends GetView<MiddlewareController> {
  const MiddlewareView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MiddlewareController>(
        initState: (_) => controller.authStateChange(),
        builder: (MiddlewareController controller) => Center(
          child: LoadingAnimationWidget.dotsTriangle(
            color: BaseTheme.secondaryColor,
            size: 50,
          ),
        ),
      ),
    );
  }
}
