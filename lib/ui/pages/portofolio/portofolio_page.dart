import 'package:SiMedit/ui/pages/portofolio/portofolio_tambah_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:SiMedit/controllers/portofolio_controller.dart';
import 'package:SiMedit/controllers/shared/format_currency.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/widgets/card.dart';

import '../../widgets/buttons.dart';

class PortofolioPage extends GetView<PortofolioController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blueColor,
        body: ListView(
          children: [
            const SizedBox(
              height: 35,
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 140,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nilai Portofolio',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: regular,
                            ),
                          ),
                          Text(
                            formatCurrency(993000),
                            style: whiteTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Target',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: regular,
                            ),
                          ),
                          Text(
                            formatCurrency(2300000),
                            style: whiteTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      color: bgColor,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        PrimaryIconButton(
                          title: 'Tambah Portofolio',
                          onPressed: () {
                            Get.to(PortofolioTambahPage());
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        PortofolioCard(
                          title: "Keyboard VortexSeries",
                          persen: 0.30,
                          terkumpul: 300000,
                          target: 1000000,
                        ),
                        PortofolioCard(
                          title: "Deskmat Tenjin",
                          persen: 0.72,
                          terkumpul: 468000,
                          target: 650000,
                        ),
                        PortofolioCard(
                          title: "TWS baru",
                          persen: 0.10,
                          terkumpul: 45000,
                          target: 450000,
                        ),
                        PortofolioCard(
                          title: "Teater JKT48",
                          persen: 0.90,
                          terkumpul: 180000,
                          target: 200000,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
