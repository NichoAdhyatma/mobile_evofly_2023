import 'package:flutter/material.dart';

import '../../../themes/base_theme.dart';

class UmkmCard extends StatelessWidget {
  const UmkmCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: BaseTheme.secondaryColor,
      ),
      child: Column(
        children: [
          Container(
            width: 300,
            height: 180,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/umkm.png'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              "Inspirasi dan Solusi untuk Pertumbuhan UMKM",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: BaseTheme.whiteColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}