import 'package:barcode_widget/barcode_widget.dart';
import 'package:basicflutter/styles/style.dart';
import 'package:basicflutter/utils/info_list.dart';
import 'package:basicflutter/utils/layout.dart';
import 'package:basicflutter/widgets/column_layout.dart';
import 'package:basicflutter/widgets/layout_builder_widget.dart';
import 'package:basicflutter/widgets/ticket_card.dart';
import 'package:basicflutter/widgets/ticket_tab.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.symmetric(
              vertical: AppLayout.getHeight(20),
              horizontal: AppLayout.getWidth(20)),
          children: [
            Gap(AppLayout.getHeight(40)),
            Text(
              "Tickets",
              style: Styles.headLineStyle1,
            ),
            Gap(AppLayout.getHeight(20)),
            const AppTicketTab(firstTab: "Upcoming", secondTab: "Previous"),
            Gap(AppLayout.getHeight(20)),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
              child: TicketCard(
                ticket: ticketList[0],
                isColor: false,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getWidth(15),
                vertical: AppLayout.getHeight(15),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: AppLayout.getWidth(15),
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppCloumnLayout(
                        firstText: "Flutter DB",
                        secondText: "Passenger",
                        alignment: CrossAxisAlignment.start,
                      ),
                      AppCloumnLayout(
                        firstText: "5221 364869",
                        secondText: "passport",
                        alignment: CrossAxisAlignment.end,
                      ),
                    ],
                  ),
                  Gap(AppLayout.getHeight(20)),
                  const AppLayoutBuilderWidget(
                    sections: 15,
                    isColor: false,
                    width: 5,
                  ),
                  Gap(AppLayout.getHeight(20)),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppCloumnLayout(
                        firstText: "364738 282774478",
                        secondText: "Number of E-ticket",
                        alignment: CrossAxisAlignment.start,
                      ),
                      AppCloumnLayout(
                        firstText: "b2SG28",
                        secondText: "Booking code",
                        alignment: CrossAxisAlignment.end,
                      ),
                    ],
                  ),
                  Gap(AppLayout.getHeight(20)),
                  const AppLayoutBuilderWidget(
                    sections: 15,
                    isColor: false,
                    width: 5,
                  ),
                  Gap(AppLayout.getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/visa.png",
                                scale: 11,
                              ),
                              Text(
                                " *** 2462",
                                style: Styles.headLineStyle3,
                              )
                            ],
                          ),
                          Gap(5),
                          Text(
                            "Payment method",
                            style: Styles.headLineStyle4,
                          )
                        ],
                      ),
                      const AppCloumnLayout(
                        firstText: "\$249.99",
                        secondText: "Price",
                        alignment: CrossAxisAlignment.end,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Gap(AppLayout.getHeight(20)),
                ],
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            //* barcode
            Container(
              margin: EdgeInsets.only(
                  left: AppLayout.getHeight(15),
                  right: AppLayout.getHeight(15)),
              padding: EdgeInsets.only(
                  top: AppLayout.getHeight(20),
                  bottom: AppLayout.getHeight(20)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(AppLayout.getHeight(21)),
                  bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getWidth(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppLayout.getHeight(15),
                  ),
                  child: BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: 'https://github.com/',
                    drawText: false,
                    color: Styles.textColor,
                    width: double.infinity,
                    height: 70,
                  ),
                ),
              ),
            ),
            Gap(AppLayout.getHeight(20)),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
              child: TicketCard(
                ticket: ticketList[0],
              ),
            ),
            Gap(AppLayout.getHeight(20)),
          ],
        ),
        Positioned(
          left: AppLayout.getHeight(22),
          top: AppLayout.getHeight(295),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Styles.textColor, width: 2),
            ),
            child: CircleAvatar(
              maxRadius: 4,
              backgroundColor: Styles.textColor,
            ),
          ),
        ),
        Positioned(
          right: AppLayout.getHeight(22),
          top: AppLayout.getHeight(295),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Styles.textColor, width: 2),
            ),
            child: CircleAvatar(
              maxRadius: 4,
              backgroundColor: Styles.textColor,
            ),
          ),
        ),
      ],
    );
  }
}
