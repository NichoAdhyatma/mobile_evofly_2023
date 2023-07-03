import 'package:flutter/material.dart';

import '../widgets/content_list.dart';
import '../widgets/skeleton_cards.dart';

Widget contentBuilder(
  data, {
  required Future<List<dynamic>> futureService,
  required String routes,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 12,
      right: 12,
      top: 12,
      bottom: 10,
    ),
    child: FutureBuilder(
      future: futureService,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SkeletonCardList(
            count: 6,
          );
        }
        return snapshot.hasData
            ? ContentList(data: data, routes: routes)
            : const Center(child: Text("Video not found ...."));
      },
    ),
  );
}
