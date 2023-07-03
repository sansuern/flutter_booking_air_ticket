import 'package:basicflutter/utils/layout.dart';
import 'package:basicflutter/widgets/icon_text_widget.dart';
import 'package:basicflutter/widgets/ticket_tab.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../styles/style.dart';
import '../widgets/double_text_widget.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return ListView(
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(20),
          vertical: AppLayout.getHeight(40)),
      children: [
        Gap(AppLayout.getHeight(40)),
        Text(
          "What are\nyou looking for?",
          style:
              Styles.headLineStyle1.copyWith(fontSize: AppLayout.getWidth(35)),
        ),
        Gap(AppLayout.getHeight(20)),
        const AppTicketTab(
          firstTab: "Airline Tickets",
          secondTab: "Hotels",
        ),
        Gap(
          AppLayout.getHeight(25),
        ),
        const AppIconText(
            icon: Icons.flight_takeoff_rounded, text: "Departure"),
        Gap(
          AppLayout.getHeight(15),
        ),
        const AppIconText(icon: Icons.flight_takeoff_rounded, text: "Arrival"),
        Gap(
          AppLayout.getHeight(25),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: AppLayout.getHeight(18),
              horizontal: AppLayout.getWidth(12)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
            color: const Color(0xD91130CE),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "find tickets",
                style: Styles.textStyle.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        Gap(
          AppLayout.getHeight(40),
        ),
        const DoubleTextWidget(
            bigText: "Upcoming Flights", smallText: "View all"),
        Gap(AppLayout.getHeight(15)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: AppLayout.getHeight(425),
              width: size.width * 0.42,
              padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getWidth(15),
                  vertical: AppLayout.getHeight(15)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 1,
                        spreadRadius: 1)
                  ]),
              child: Column(
                children: [
                  Container(
                    height: AppLayout.getHeight(190),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppLayout.getHeight(12)),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/sit.jpg"),
                        )),
                  ),
                  Gap(AppLayout.getHeight(15)),
                  Text(
                    "20% discount on the early booking of this flight. Don't miss",
                    style: Styles.headLineStyle2,
                  )
                ],
              ),
            ),
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: size.width * 0.44,
                      height: AppLayout.getHeight(200),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3Ab8B8),
                        borderRadius: BorderRadius.circular(
                          AppLayout.getHeight(18),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.getWidth(15),
                          vertical: AppLayout.getHeight(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Discount\nfor survey",
                            style: Styles.headLineStyle2.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Gap(AppLayout.getHeight(10)),
                          Text(
                            "Take the survey about our services and get discount",
                            style: Styles.headLineStyle2.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: -45,
                      top: -40,
                      child: Container(
                        padding: EdgeInsets.all(AppLayout.getHeight(30)),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 18, color: const Color(0xFF189999)),
                        ),
                      ),
                    )
                  ],
                ),
                Gap(AppLayout.getHeight(15)),
                Container(
                  width: size.width * 0.44,
                  height: AppLayout.getHeight(210),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.getWidth(15),
                      vertical: AppLayout.getHeight(15)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppLayout.getHeight(18),
                    ),
                    color: const Color(0xFFEC6545),
                  ),
                  child: Column(children: [
                    Text(
                      "Take Love",
                      style: Styles.headLineStyle2.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Gap(AppLayout.getHeight(5)),
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(text: "😍", style: TextStyle(fontSize: 35)),
                        TextSpan(text: "😘", style: TextStyle(fontSize: 45)),
                        TextSpan(text: "😚", style: TextStyle(fontSize: 35)),
                      ]),
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
