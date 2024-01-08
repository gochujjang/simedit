import 'package:SiMedit/controllers/pilih_portofolio_controller.dart';
import 'package:SiMedit/controllers/transaksi_tambah_controller.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_page.dart';
import '../../widgets/buttons.dart';

class PortofolioTransaksiPage extends StatelessWidget {
  final TransaksiTambahController statusController =
      TransaksiTambahController();
  final PilihPortofolioController portofolioListDropdown =
      Get.put(PilihPortofolioController());

  final List<String> portofolioList = [
    "Keyboard VortexSeries",
    "Deskmat Tenjin",
    "TWS baru",
    "Teater JKT48",
  ].toSet().toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        iconTheme: IconThemeData(color: whiteColor),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(
            'assets/ic_back.png',
            width: 24,
            height: 24,
            color: whiteColor,
          ),
        ),
        title: Text(
          "Transaksi Portofolio",
          style: font_semiBold.copyWith(
            color: whiteColor,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: blueColor,
              ),
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(27),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              statusController.isStatusActive.value = false;
                            },
                            child: Obx(() => Container(
                                  width: 156,
                                  height: 54,
                                  margin: const EdgeInsets.only(
                                    right: 15,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 22.5,
                                    vertical: 13,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        statusController.isStatusActive.value ==
                                                false
                                            ? blueColor
                                            : Colors.transparent,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: blueColor,
                                      width: statusController
                                                  .isStatusActive.value ==
                                              false
                                          ? 0
                                          : 3,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Pemasukan',
                                      style: font_semiBold.copyWith(
                                        fontSize: 14,
                                        color: statusController
                                                    .isStatusActive.value ==
                                                false
                                            ? whiteColor
                                            : blueColor,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              statusController.isStatusActive.value = true;
                            },
                            child: Obx(() => Container(
                                  width: 156,
                                  height: 54,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 22.5,
                                    vertical: 13,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        statusController.isStatusActive.value ==
                                                true
                                            ? blueColor
                                            : Colors.transparent,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: statusController
                                                  .isStatusActive.value ==
                                              true
                                          ? Colors.transparent
                                          : blueColor,
                                      width: 3,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Pengeluaran',
                                      style: font_semiBold.copyWith(
                                        color: statusController
                                                    .isStatusActive.value ==
                                                true
                                            ? whiteColor
                                            : blueColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      InputFieldNumber(
                        title: "Nominal",
                        hintText: "Masukkan nominal..",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      //dropdown
                      Container(
                        padding: const EdgeInsets.only(
                          top: 0,
                        ),
                        child: Obx(
                          () => Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: greyColor,
                              ),
                            ),
                            child: DropdownButton<String>(
                              hint: Text(
                                'Pilih Portofolio',
                                style: font_regular.copyWith(
                                  color: darkGreyColor,
                                  fontSize: 14,
                                  fontWeight: regular,
                                ),
                              ),
                              padding: const EdgeInsets.only(
                                top: 12,
                                bottom: 12,
                                left: 22,
                                right: 22,
                              ),
                              isExpanded: true,
                              underline: SizedBox(),
                              value: portofolioListDropdown
                                          .selectedItem.value ==
                                      ""
                                  ? null
                                  : portofolioListDropdown.selectedItem.value,
                              onChanged: (newValue) {
                                portofolioListDropdown
                                    .updateSelectedItem(newValue.toString());
                              },
                              items:
                                  portofolioList.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: font_regular,
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      PrimaryIconButton(
                        title: "Tambah Transaksi",
                        onPressed: () {
                          Get.off(() => HomePage(), arguments: {'tabIndex': 1});
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
