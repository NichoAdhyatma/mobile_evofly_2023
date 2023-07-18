import 'package:flutter/material.dart';

import 'label_tag.dart';


class labelRow2 extends StatelessWidget {
  const labelRow2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LabelTag(id: 4, text: "Bisnis"),
        LabelTag(id: 5, text: "Digital Marketing"),
        LabelTag(id: 6, text: "Teknologi"),
      ],
    );
  }
}

class labelRow1 extends StatelessWidget {
  const labelRow1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LabelTag(id: 1, text: "Social Media"),
        LabelTag(id: 2, text: "Inovasi"),
        LabelTag(id: 3, text: "Keuangan"),
      ],
    );
  }
}