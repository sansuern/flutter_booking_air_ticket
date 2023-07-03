import 'package:basicflutter/utils/layout.dart';
import 'package:basicflutter/styles/style.dart';
import 'package:basicflutter/widgets/layout_builder_widget.dart';
import 'package:basicflutter/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TicketCard extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketCard({super.key, required this.ticket, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(GetPlatform.isAndroid == true ? 168 : 169),
      child: Container(
          margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
          child: Column(
            children: [
              //*  Showing the blue part of the card/ticket
              Container(
                decoration: BoxDecoration(
                    color: isColor == null ? Styles.bgPrimary : Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(21),
                        topRight: Radius.circular(21))),
                padding: EdgeInsets.all(AppLayout.getHeight(16)),
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle3
                                .copyWith(color: Colors.grey.shade700),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      const ThickContainer(isColor: true),
                      Expanded(
                        child: Stack(children: [
                          SizedBox(
                              height: AppLayout.getHeight(24),
                              child: const AppLayoutBuilderWidget(
                                sections: 6,
                                isColor: false,
                              )),
                          Center(
                            child: Transform.rotate(
                              angle: 1.5,
                              child: Icon(
                                Icons.local_airport_rounded,
                                color: isColor == null
                                    ? Colors.white
                                    : const Color(0xFF8ACCF7),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      const ThickContainer(isColor: true),
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        ticket['to']['code'],
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle3
                                .copyWith(color: Colors.grey.shade700),
                      )
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(ticket['from']['name'],
                            style: isColor == null
                                ? Styles.headLineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle4),
                      ),
                      Text(ticket['flying_time'],
                          style: isColor == null
                              ? Styles.headLineStyle4
                                  .copyWith(color: Colors.white)
                              : Styles.headLineStyle4),
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(ticket['to']['name'],
                            textAlign: TextAlign.end,
                            style: isColor == null
                                ? Styles.headLineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle4),
                      ),
                    ],
                  )
                ]),
              ),
              //*  Showing the orange part of the card/ticket
              Container(
                color: isColor == null ? Styles.orangeColor : Colors.white,
                child: Row(children: [
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: const DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10)))),
                  ),
                  const Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(.0),
                        child: AppLayoutBuilderWidget(sections: 15)),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: const DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10)))),
                  ),
                ]),
              ),

              //*  Bottom the orange part of the card/ticket
              Container(
                decoration: BoxDecoration(
                    color: isColor == null ? Styles.orangeColor : Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                        bottomRight:
                            Radius.circular(isColor == null ? 21 : 0))),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ticket['date'],
                              style: isColor == null
                                  ? Styles.headLineStyle3
                                      .copyWith(color: Colors.white)
                                  : Styles.headLineStyle3
                                      .copyWith(color: Colors.grey.shade700),
                            ),
                            const Gap(5),
                            Text(
                              "Date",
                              style: isColor == null
                                  ? Styles.headLineStyle4
                                      .copyWith(color: Colors.white)
                                  : Styles.headLineStyle4,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              ticket['departure_time'],
                              style: isColor == null
                                  ? Styles.headLineStyle3
                                      .copyWith(color: Colors.white)
                                  : Styles.headLineStyle3
                                      .copyWith(color: Colors.grey.shade700),
                            ),
                            const Gap(5),
                            Text(
                              "Departure time",
                              style: isColor == null
                                  ? Styles.headLineStyle4
                                      .copyWith(color: Colors.white)
                                  : Styles.headLineStyle4,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${ticket['number']}',
                              style: isColor == null
                                  ? Styles.headLineStyle3
                                      .copyWith(color: Colors.white)
                                  : Styles.headLineStyle3
                                      .copyWith(color: Colors.grey.shade700),
                            ),
                            const Gap(5),
                            Text(
                              "Number",
                              style: isColor == null
                                  ? Styles.headLineStyle4
                                      .copyWith(color: Colors.white)
                                  : Styles.headLineStyle4,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
