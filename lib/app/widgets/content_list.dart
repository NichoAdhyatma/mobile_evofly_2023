import 'package:Evofly/app/widgets/content_card.dart';
import 'package:flutter/material.dart';

class ContentList extends StatelessWidget {
  const ContentList({Key? key, required this.data, required this.routes})
      : super(key: key);

  final List<dynamic> data;
  final String routes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                var item = data[index];
                return ContentCard(item: item, routes: routes);
              },
            ),
          ),
        ),
      ],
    );
  }
}
