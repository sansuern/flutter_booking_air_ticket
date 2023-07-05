import 'package:basicflutter/services/webapi_service.dart';
import 'package:basicflutter/utils/info_list.dart';
import 'package:basicflutter/widgets/double_text_widget.dart';
import 'package:basicflutter/widgets/hotels_card.dart';
import 'package:basicflutter/widgets/ticket_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../styles/style.dart';

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
              DoubleTextWidget(bigText: "Hotels", smallText: "View all"),
            ],
          ),
        ),
        const Gap(15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: hotelList
                .map((singleHotel) => HotelCard(hotel: singleHotel))
                .toList(),
          ),
        ),
        const Gap(45),
      ],
    );
  }
}
