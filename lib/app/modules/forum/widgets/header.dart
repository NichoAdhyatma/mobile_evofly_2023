import 'package:flutter/material.dart';

import '../../../themes/base_theme.dart';
import 'modal_bottomsheet.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Forum',
          style: BaseTheme.mediumText.copyWith(
            fontSize: 25,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            backgroundColor: BaseTheme.semidark,
          ),
          onPressed: () {
            buildModalBottomSheet(context);
          },
          child: Row(
            children: [
              Text(
                "Sorting dan Tag",
                style: BaseTheme.mediumText.copyWith(
                  color: BaseTheme.whiteColor,
                  fontSize: 15,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}