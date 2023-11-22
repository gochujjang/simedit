import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SiMedit/controllers/shared/format_currency.dart';
import 'package:SiMedit/controllers/home_controller.dart';
import 'package:SiMedit/theme.dart';

import 'widgets/card.dart';

class BerandaPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [
            buildProfile(),
            const SizedBox(
              height: 24,
            ),
            buildWalletCard(),
            const SizedBox(
              height: 36,
            ),
            Text(
              'Transaksi Terakhir',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TransaksiCard(
              title: "Wareg",
              status: false,
            ),
            TransaksiCard(
              title: "Gajian",
            ),
            TransaksiCard(
              title: "Wareg",
              status: false,
            ),
            TransaksiCard(
              title: "Gajian",
            ),
            TransaksiCard(
              title: "Wareg",
              status: false,
            ),
            const SizedBox(
              height: 36,
            ),
            Text(
              'Tujuan Nabung',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MiniPortofolioCard(
              title: 'Buat beli mobil',
              persen: 0.55,
            ),
            MiniPortofolioCard(
              title: 'Buat beli mobil',
              persen: 0.58,
            ),
            MiniPortofolioCard(
              title: 'Buat beli mobil',
              persen: 0.25,
            ),
            const SizedBox(
              height: 55,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfile() {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo,',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                'Sobat Medit',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              controller.changeTabIndex(4);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/ic_avatar.png',
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWalletCard() {
    return Container(
      width: double.infinity,
      height: 220,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            'assets/ic_bg_card.png',
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Erico Astama',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Uang',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
              ),
              Text(
                formatCurrency(15000000),
                style: whiteTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
