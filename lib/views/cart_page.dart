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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Align(
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
                    return Column(
                      children: [
                        Container(
                          height: AppLayout.getHeight(800),
                          width: double.maxFinite,
                          child: ListView.builder(
                            itemCount: state.cart.length,
                            itemBuilder: (context, index) {
                              if (state.cartIsLoading) {
                                return Text("Loading...");
                              }
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(state.cart[index].image),
                                    Text(state.cart[index].place),
                                    Text(state.cart[index].destination),
                                    Text(
                                      state.cart[index].price.toString(),
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Styles.bgPrimary),
                                          onPressed: () =>
                                              context.read<CartBloc>().add(
                                                    CartEdit(state.cart.indexOf(
                                                        state.cart[index])),
                                                  ),
                                          child: Text("Edit"),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ElevatedButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Styles.orangeColor),
                                          onPressed: () =>
                                              context.read<CartBloc>().add(
                                                    CartRemove(state.cart
                                                        .indexOf(
                                                            state.cart[index])),
                                                  ),
                                          child: Text("Remove"),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
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
