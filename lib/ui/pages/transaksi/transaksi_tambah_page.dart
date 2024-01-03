import 'package:SiMedit/controllers/shared/datepicker_controller.dart';
import 'package:SiMedit/controllers/transaksi_tambah_controller.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/pages/home_page.dart';
import 'package:SiMedit/ui/widgets/buttons.dart';
import 'package:SiMedit/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransaksiTambahPage extends StatelessWidget {
  final TransaksiTambahController statusController =
      TransaksiTambahController();
  final DatePickerController dateController = DatePickerController();

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
          "Tambah Transaksi",
          style: whiteTextStyle.copyWith(
            fontWeight: semiBold,
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
                                      'Pendapatan',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: semiBold,
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
                                      style: blueTextStyle.copyWith(
                                        color: statusController
                                                    .isStatusActive.value ==
                                                true
                                            ? whiteColor
                                            : blueColor,
                                        fontSize: 14,
                                        fontWeight: semiBold,
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
                      InputFieldDate(
                        title: "Tanggal",
                        hintText: "HH/BB/TTTT",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InputField(
                        title: "Keterangan",
                        hintText: "Isi deskripsi singkat",
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      PrimaryIconButton(
                        title: "Tambah Transaksi",
                        onPressed: () {
                          Get.back();
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
