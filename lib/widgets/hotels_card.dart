import 'package:basicflutter/bloc/cart_bloc.dart';
import 'package:basicflutter/utils/layout.dart';
import 'package:basicflutter/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../models/cart.dart';
import '../models/user.dart';

class HotelCard extends StatelessWidget {
  final hotel;
  const HotelCard({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      width: size.width * 0.6,
      height: AppLayout.getHeight(375),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(right: 17, top: 5),
      decoration: BoxDecoration(
        color: Styles.primaryColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 2,
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppLayout.getHeight(180),
            decoration: BoxDecoration(
              color: Styles.primaryColor,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/${hotel['image']}"),
              ),
            ),
          ),
          const Gap(15),
          Text(
            hotel['place'],
            style: Styles.headLineStyle2.copyWith(color: Styles.kakiColor),
          ),
          const Gap(5),
          Text(
            hotel['destination'],
            style: Styles.headLineStyle3.copyWith(color: Colors.white),
          ),
          const Gap(8),
          Text(
            "\$${hotel['price']}/night",
            style: Styles.headLineStyle1.copyWith(color: Styles.kakiColor),
          ),
          const Gap(8),
          Row(
            children: [
              ElevatedButton(
                style:
                    TextButton.styleFrom(backgroundColor: Styles.orangeColor),
                onPressed: () => context.read<CartBloc>().add(
                      CartAdd(
                        CartModel(
                          id: hotel['id'],
                          image: hotel['image'],
                          destination: hotel['destination'],
                          place: hotel['place'],
                          price: hotel['price'],
                        ),
                      ),
                    ),
                child: const Text("Booking"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
