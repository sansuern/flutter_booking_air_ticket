import 'package:basicflutter/models/cart.dart';
import 'package:basicflutter/styles/style.dart';
import 'package:basicflutter/utils/layout.dart';
import 'package:basicflutter/widgets/column_layout.dart';
import 'package:basicflutter/widgets/layout_builder_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../bloc/cart_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  Widget mapDataToWidget(
      {required BuildContext context, required List<CartModel> data}) {
    final size = AppLayout.getSize(context);
    List<Widget> widget = [];
    for (var i = 0; i < data.length; i++) {
      widget.add(SizedBox(
        width: size.width * 0.39,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/${data[i].image}",
              height: 200,
              fit: BoxFit.cover,
            ),
            Text(data[i].place),
            Text(data[i].destination),
            Text(data[i].price.toString()),
            Row(
              children: [
                ElevatedButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Styles.bgPrimary),
                  onPressed: () => context.read<CartBloc>().add(
                        CartEdit(data.indexOf(data[i])),
                      ),
                  child: const Text("Edit"),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Styles.orangeColor),
                  onPressed: () => context.read<CartBloc>().add(
                        CartRemove(data.indexOf(data[i])),
                      ),
                  child: const Text("Remove"),
                ),
              ],
            )
          ],
        ),
      ));
    }
    return Wrap(
        spacing: AppLayout.getWidth(10),
        runSpacing: AppLayout.getHeight(10),
        children: widget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Align(
            alignment: AlignmentDirectional.topStart,
            child: Text("Cart Page"),
          ),
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
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return mapDataToWidget(context: context, data: state.cart);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
