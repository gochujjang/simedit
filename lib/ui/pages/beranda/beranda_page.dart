import 'package:SiMedit/controllers/profile_controller.dart';
import 'package:SiMedit/controllers/transaksi_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:SiMedit/controllers/shared/format_currency.dart';
import 'package:SiMedit/controllers/home_controller.dart';
import 'package:SiMedit/theme.dart';
import 'package:intl/intl.dart';

import '../../widgets/card.dart';

class BerandaPage extends GetView<HomeController> {
  TransaksiController transaksiController = Get.put(TransaksiController());

  Future<void> _onRefresh() async {
    await transaksiController.doTotalUang();
    await transaksiController.getTransaksi();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: bgColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
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
                style: font_semiBold.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => transaksiController.latestTransaksi.isEmpty
                    ? Text(
                        "Data tidak ditemukan\nSilahkan tambah transaksi",
                        textAlign: TextAlign.center,
                        style: font_medium.copyWith(
                          color: darkGreyColor,
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: transaksiController.latestTransaksi.length,
                        itemBuilder: (context, index) {
                          var transaksiData =
                              transaksiController.latestTransaksi[index];
                          final title = transaksiData['Keterangan'] != null
                              ? transaksiData['Keterangan']
                              : 'Data tidak tersedua';
                          final nominal = transaksiData['nominal'] != null
                              ? int.parse(transaksiData['nominal'].toString())
                              : 0;
                          final status = transaksiData['status'] != null
                              ? transaksiData['status']
                              : 'Data tidak tersedua';
                          final tgl = transaksiData['created_at'] != null
                              ? DateFormat('dd-MM-yyyy, HH:mm').format(
                                  DateTime.parse(transaksiData['created_at']))
                              : 'Data tidak tersedua';

                          return TransaksiCard(
                            title: title,
                            nominal: nominal,
                            status: status == 'pemasukan' ? true : false,
                            tanggal: tgl,
                          );
                        },
                      ),
              ),
              const SizedBox(
                height: 36,
              ),
              Text(
                'Tujuan Nabung',
                style: font_semiBold.copyWith(
                  fontSize: 16,
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
                style: font_semiBold.copyWith(
                  fontSize: 18,
                ),
              ),
              Text(
                'Sobat Medit',
                style: font_regular.copyWith(
                  fontSize: 16,
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
    ProfileController profileController = Get.put(ProfileController());
    TransaksiController transaksiController = Get.put(TransaksiController());
    var totalUang = transaksiController.totalUang;
    var profile = profileController.profile;
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
          Obx(
            () => Text(
              '${profile['name']}',
              style: font_medium.copyWith(
                color: whiteColor,
                fontSize: 18,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Uang',
                style: font_regular.copyWith(
                  color: whiteColor,
                  fontSize: 16,
                  fontWeight: regular,
                ),
              ),
              Obx(() => Text(
                    formatCurrency(totalUang.value),
                    style: font_semiBold.copyWith(
                      color: whiteColor,
                      fontSize: 24,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
