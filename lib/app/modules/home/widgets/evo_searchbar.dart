import 'package:flutter/material.dart';

import '../../../const/base_theme.dart';

class EvoSearchBar extends StatelessWidget {
  const EvoSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: BaseTheme.shadowColor,
      borderRadius: BorderRadius.circular(75),
      child: TextField(
        controller: TextEditingController(),
        decoration: const InputDecoration(
          hintText: "Cari",
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}