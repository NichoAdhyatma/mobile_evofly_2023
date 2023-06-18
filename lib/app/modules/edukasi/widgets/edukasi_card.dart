import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../themes/base_theme.dart';

class EdukasiCard extends StatelessWidget {
  const EdukasiCard({
    super.key,
    required this.desc, required this.icon,
  });

  final String desc;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: BaseTheme.shadowColor,
      borderRadius: BorderRadius.circular(10),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 130,
            height: 120,
            decoration: const BoxDecoration(
              color: BaseTheme.secondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: FaIcon(
              icon,
              color: BaseTheme.whiteColor,
              size: 50,
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(
                left: 10,
                top: 10,
              ),
              height: 120,
              decoration: const BoxDecoration(
                color: BaseTheme.whiteColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                desc,
                maxLines: 4,
                style: BaseTheme.mediumText.copyWith(
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}