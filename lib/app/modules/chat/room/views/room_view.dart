import 'package:Evofly/app/themes/base_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/room_controller.dart';

class RoomView extends GetView<RoomController> {
  const RoomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<RoomController>(
      initState: (_) => controller.fetchChatPartnerStream(),
      builder: (RoomController controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: BaseTheme.shadowColor,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.partner.value.name,
                style: BaseTheme.normalText.copyWith(
                  fontSize: 14,
                ),
              ),
              Text(
                controller.partner.value.status,
                style: BaseTheme.secondaryText.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            //chat- container
            Expanded(
              child: ListView(
                children: [],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
