import 'package:basicflutter/styles/style.dart';
import 'package:basicflutter/utils/layout.dart';
import 'package:basicflutter/widgets/column_layout.dart';
import 'package:basicflutter/widgets/layout_builder_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(20),
          vertical: AppLayout.getHeight(20)),
      children: [
        Gap(AppLayout.getHeight(40)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 86,
              width: 86,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/img_1.png"),
                ),
                borderRadius: BorderRadius.circular(
                  AppLayout.getHeight(10),
                ),
              ),
            ),
            Gap(
              AppLayout.getWidth(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Book Tickets", style: Styles.headLineStyle1),
                Text(
                  "New-York",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500),
                ),
                Gap(
                  AppLayout.getWidth(8),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppLayout.getHeight(100),
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getWidth(3),
                    vertical: AppLayout.getHeight(3),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF526799),
                        ),
                        child: const Icon(
                          FluentSystemIcons.ic_fluent_shield_filled,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      Gap(
                        AppLayout.getWidth(8),
                      ),
                      const Text(
                        "Premium status",
                        style: TextStyle(
                          color: Color(0xFF526799),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                InkWell(
                  // ignore: avoid_print
                  onTap: () => print("Pressed!"),
                  child: Text(
                    "Edit",
                    style: Styles.textStyle.copyWith(
                        color: Styles.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
        Gap(AppLayout.getHeight(8)),
        Divider(
          color: Colors.grey.shade300,
        ),
        Gap(AppLayout.getHeight(8)),
        Stack(
          children: [
            Container(
              height: AppLayout.getHeight(90),
              decoration: BoxDecoration(
                color: Styles.primaryColor,
                borderRadius: BorderRadius.circular(
                  AppLayout.getHeight(18),
                ),
              ),
            ),
            Positioned(
              top: -40,
              right: -45,
              child: Container(
                padding: EdgeInsets.all(
                  AppLayout.getHeight(30),
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(width: 18, color: Color(0xFF264CD2)),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getHeight(25),
                  vertical: AppLayout.getHeight(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(
                        FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                        color: Styles.primaryColor),
                    maxRadius: 25,
                    backgroundColor: Colors.white,
                  ),
                  Gap(AppLayout.getHeight(12)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You'v got a new award",
                        style: Styles.headLineStyle2.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        "You have 95 flights in a year",
                        style: Styles.headLineStyle2.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Gap(AppLayout.getHeight(25)),
        Text(
          "Accumulated miles",
          style: Styles.headLineStyle2,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(15),
            vertical: AppLayout.getHeight(15),
          ),
          child: Column(
            children: [
              Gap(AppLayout.getHeight(15)),
              Text(
                "192802",
                style: TextStyle(
                  color: Styles.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 45,
                ),
              ),
              Gap(AppLayout.getHeight(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Miles accrued",
                    style: Styles.headLineStyle4.copyWith(fontSize: 16),
                  ),
                  Text(
                    "23 May 2022",
                    style: Styles.headLineStyle4.copyWith(fontSize: 16),
                  ),
                ],
              ),
              Gap(AppLayout.getHeight(4)),
              Divider(color: Colors.grey.shade300),
              Gap(AppLayout.getHeight(4)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppCloumnLayout(
                      firstText: "23 042",
                      secondText: "Miles",
                      alignment: CrossAxisAlignment.start),
                  AppCloumnLayout(
                      firstText: "Airline CO",
                      secondText: "Received from",
                      alignment: CrossAxisAlignment.end),
                ],
              ),
              Gap(AppLayout.getHeight(12)),
              const AppLayoutBuilderWidget(
                sections: 12,
                isColor: false,
              ),
              Gap(AppLayout.getHeight(12)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppCloumnLayout(
                      firstText: "24",
                      secondText: "Miles",
                      alignment: CrossAxisAlignment.start),
                  AppCloumnLayout(
                      firstText: "McDonal's",
                      secondText: "Received from",
                      alignment: CrossAxisAlignment.end),
                ],
              ),
              Gap(AppLayout.getHeight(12)),
              const AppLayoutBuilderWidget(
                sections: 12,
                isColor: false,
              ),
              Gap(AppLayout.getHeight(12)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppCloumnLayout(
                      firstText: "52 340",
                      secondText: "Miles",
                      alignment: CrossAxisAlignment.start),
                  AppCloumnLayout(
                      firstText: "McDonal's",
                      secondText: "Received from",
                      alignment: CrossAxisAlignment.end),
                ],
              ),
            ],
          ),
        ),
        Gap(AppLayout.getHeight(20)),
        Center(
          child: InkWell(
            onTap: () => print("Pressed !"),
            child: Text(
              "How to get more miles",
              style: Styles.textStyle.copyWith(
                color: Styles.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
