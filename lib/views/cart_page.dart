import 'package:basicflutter/styles/style.dart';
import 'package:basicflutter/utils/layout.dart';
import 'package:basicflutter/widgets/column_layout.dart';
import 'package:basicflutter/widgets/layout_builder_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text("Cart Page")),
          backgroundColor: Styles.bgPrimary),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(20),
            vertical: AppLayout.getHeight(20)),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(40),
                Text("test"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
