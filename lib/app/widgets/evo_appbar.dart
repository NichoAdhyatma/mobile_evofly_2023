import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../const/app_theme.dart';

class EvoAppBar extends StatelessWidget {
  const EvoAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + Get.height * 0.01,
        left: 20,
        bottom: Get.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: ThemeConfig.primaryColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.6),
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
            offset: const Offset(0, 0.2),
          ),
        ],
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
    );
  }
}