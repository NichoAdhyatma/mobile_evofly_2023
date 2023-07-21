import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/base_theme.dart';
import '../controllers/chat_controller.dart';

class NewChatButton extends GetView<ChatController> {
  const NewChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      initState: (_) => controller.fetchContact(),
      builder: (ChatController controller) => FloatingActionButton(
        onPressed: () async {
          return showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              builder: (context) => ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Pilih Mentor",
                              style: BaseTheme.mediumText.copyWith(
                                fontSize: 25,
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.contact.length,
                              itemBuilder: (context, index) {
                                var contact = controller.contact[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () => Get.toNamed(Routes.ROOM,
                                        arguments: contact),
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 4.0,
                                      ),
                                      leading: const Icon(
                                        Icons.person,
                                        size: 50,
                                      ),
                                      tileColor: BaseTheme.whiteColor,
                                      title: Text(
                                        contact.name,
                                        style: BaseTheme.mediumText,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      subtitle: const Text("Mulai Chat"),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
        },
        child: const Icon(Icons.chat_bubble_rounded),
      ),
    );
  }
}
