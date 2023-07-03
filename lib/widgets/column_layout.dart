import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../styles/style.dart';
import '../utils/layout.dart';

class AppCloumnLayout extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final String firstText;
  final String secondText;
  const AppCloumnLayout(
      {super.key,
      required this.firstText,
      required this.secondText,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          firstText,
          style: Styles.headLineStyle3.copyWith(color: Styles.textColor),
        ),
        Gap(AppLayout.getHeight(5)),
        Text(
          secondText,
          style: Styles.headLineStyle4,
        ),
      ],
    );
  }
}
