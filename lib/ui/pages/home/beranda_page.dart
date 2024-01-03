import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SiMedit/controllers/shared/format_currency.dart';
import 'package:SiMedit/controllers/home_controller.dart';
import 'package:SiMedit/theme.dart';

import '../../widgets/card.dart';

class BerandaPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
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
              title: "Makan diluar",
              nominal: 20000,
              status: false,
              tanggal: '20-05-2023, 12:00',
            ),
            TransaksiCard(
              title: "Paket Data",
              nominal: 50000,
              status: false,
              tanggal: '20-11-2023, 08:45',
            ),
            TransaksiCard(
              title: "Online Shopping",
              nominal: 350000,
              status: false,
              tanggal: '15-11-2023, 14:30',
            ),
            TransaksiCard(
              title: "Part-Time",
              nominal: 1500000,
              tanggal: '02-11-2023, 12:30',
            ),
            TransaksiCard(
              title: "Uang Saku",
              nominal: 2000000,
              tanggal: '02-11-2023, 07:30',
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
              title: 'Keyboard VortexSeries',
              persen: 0.30,
            ),
            MiniPortofolioCard(
              title: 'Deskmat Tenjin',
              persen: 0.72,
            ),
            MiniPortofolioCard(
              title: 'TWS baru',
              persen: 0.10,
            ),
            MiniPortofolioCard(
              title: 'Tiket Konser JKT48',
              persen: 0.90,
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
                formatCurrency(3080000),
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
