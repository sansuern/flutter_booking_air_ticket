import 'package:basicflutter/bloc/cart_bloc.dart';
import 'package:basicflutter/config.dart';
import 'package:basicflutter/services/webapi_service.dart';
import 'package:basicflutter/utils/info_list.dart';
import 'package:basicflutter/widgets/double_text_widget.dart';
import 'package:basicflutter/widgets/hotels_card.dart';
import 'package:basicflutter/widgets/ticket_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../styles/style.dart';
import '../models/user.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // WebapiService().feed();
  }

  final user = FirebaseAuth.instance.currentUser;

  void SignUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning ${user!.email!}",
                        style: Styles.headLineStyle3,
                      ),
                      const Gap(5),
                      Text(
                        "Book Tickets",
                        style: Styles.headLineStyle1,
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img_1.png"),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(25),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF4F6FD)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      FluentSystemIcons.ic_fluent_search_regular,
                      color: Colors.grey.shade500,
                    ),
                    InkWell(
                      onTap: () {
                        SignUserOut();
                      },
                      child: Text(
                        "Search",
                        style: Styles.headLineStyle4,
                      ),
                    )
                  ],
                ),
              ),
              const Gap(45),
              const DoubleTextWidget(
                  bigText: "Upcoming Flights", smallText: "View all")
            ],
          ),
        ),
        const Gap(15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: ticketList.map((e) => TicketCard(ticket: e)).toList(),
          ),
        ),
        const Gap(15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Column(
            children: [
              DoubleTextWidget(bigText: "Hotels ", smallText: "View all"),
            ],
          ),
        ),
        const Gap(15),
        StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection("card_tickets").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //* hotels
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: snapshot.data!.docs.map((hotel) {
                  return HotelCard(hotel: hotel);
                }).toList(),
              ),
            );
          },
        ),
        const Gap(45),

        const Text("In your cart"),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Column(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.cart.length,
                  itemBuilder: (context, index) {
                    if (state.cartIsLoading) {
                      return const Text("Loading...");
                    }
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.cart[index].image),
                          Text(state.cart[index].place),
                          Text(state.cart[index].destination),
                          Text(
                            state.cart[index].price.toString(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          },
        )

        // ListView.builder(itemBuilder: itemBuilder)
      ],
    );
  }
}
