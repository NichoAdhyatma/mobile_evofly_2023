import 'package:Evofly/app/widgets/content_card.dart';
import 'package:flutter/material.dart';

class ContentList extends StatelessWidget {
  const ContentList({Key? key, required this.data, required this.routes})
      : super(key: key);

  final List<dynamic> data;
  final String routes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        var item = data[index];
        return Padding(
          padding: const EdgeInsets.only(
            top: 12,
            left: 12,
            right: 12,
          ),
          child: ContentCard(item: item, routes: routes),
        );
      },
    );
  }
}
