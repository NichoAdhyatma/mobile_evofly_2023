import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/base_theme.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    Key? key,
    required this.item,
    required this.routes,
  }) : super(key: key);

  final dynamic item;
  final String routes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: GestureDetector(
        onTap: () => Get.toNamed(routes, arguments: item),
        child: Material(
          color: BaseTheme.whiteColor,
          elevation: 5,
          shadowColor: BaseTheme.shadowColor,
          borderRadius: BorderRadius.circular(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                width: 170,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(
                        item.imageUrl,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.title,
                    style: BaseTheme.mediumText.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
