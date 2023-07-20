import 'package:Evofly/app/themes/base_theme.dart';
import 'package:Evofly/app/widgets/skeleton_cards.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forum_controller.dart';
import '../widgets/forum_card.dart';
import '../widgets/header.dart';
import '../widgets/new_post_button.dart';

class ForumView extends GetView<ForumController> {
  const ForumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<ForumController>(
        init: ForumController(),
        initState: (_) => controller.fetchForum(),
        builder: (ForumController controller) => RefreshIndicator(
          backgroundColor: BaseTheme.secondaryColor,
          onRefresh: () async {
            await controller.fetchForum();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Header(),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: controller.isLoading.value
                      ? const SkeletonCardList(count: 6)
                      : ListView.builder(
                          controller: controller.scrollController,
                          itemCount: controller.forumList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var forum = controller.forumList[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: ForumCard(
                                forumModel: forum,
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: const NewPostButton(),
    );
  }
}
