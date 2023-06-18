import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../themes/base_theme.dart';

class EvoAppBar extends StatelessWidget {
  const EvoAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: BaseTheme.shadowColor,
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + Get.height * 0.01,
          left: 20,
          bottom: Get.height * 0.01,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 110,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/app-logo-4.png',
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.message,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
