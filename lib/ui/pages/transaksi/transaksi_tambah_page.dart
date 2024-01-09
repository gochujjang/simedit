import 'package:SiMedit/controllers/shared/datepicker_controller.dart';
import 'package:SiMedit/controllers/transaksi_tambah_controller.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/widgets/buttons.dart';
import 'package:SiMedit/ui/widgets/datepicker.dart';
import 'package:SiMedit/ui/widgets/forms.dart';
import 'package:SiMedit/ui/widgets/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransaksiTambahPage extends StatelessWidget {
  final TransaksiTambahController controller = TransaksiTambahController();
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
                  child: Form(
                    key: controller.formKey,
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
                                controller.status = 'pemasukan';
                                controller.isStatusActive.value = false;
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
                                      color: controller.isStatusActive.value ==
                                              false
                                          ? blueColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: blueColor,
                                        width:
                                            controller.isStatusActive.value ==
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
                                          color:
                                              controller.isStatusActive.value ==
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
                                controller.status = 'pengeluaran';
                                controller.isStatusActive.value = true;
                              },
                              child: Obx(() => Container(
                                    width: 156,
                                    height: 54,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 22.5,
                                      vertical: 13,
                                    ),
                                    decoration: BoxDecoration(
                                      color: controller.isStatusActive.value ==
                                              true
                                          ? blueColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color:
                                            controller.isStatusActive.value ==
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
                                          color:
                                              controller.isStatusActive.value ==
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
                          validator: Validator.required,
                          onChange: (value) {
                            controller.nominal = value;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        QDatePicker(
                          label: "Tanggal",
                          validator: Validator.required,
                          value: DateTime.now(),
                          onChanged: (value) {
                            controller.tanggal = value.toString();
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputField(
                              title: "Keterangan",
                              hintText: "Isi deskripsi singkat",
                              validator: Validator.required,
                              onChange: (value) {
                                controller.keterangan = value;
                              },
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Input Keterangan max 20 karakter",
                              style: font_regular.copyWith(
                                fontSize: 12,
                                color: darkGreyColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        PrimaryIconButton(
                          title: "Tambah Transaksi",
                          onPressed: () {
                            final formattedNominal =
                                controller.nominal?.replaceAll(".", "");
                            String formattedTanggal =
                                DateFormat('yyyy-MM-dd').format(
                              DateTime.parse('${controller.tanggal}'),
                            );
                            controller.tanggal = formattedTanggal;
                            controller.nominal = formattedNominal;
                            print("Status : ${controller.status}");
                            print("Nominal : ${formattedNominal}");
                            print("Tanggal : ${controller.tanggal}");
                            print("Keterangan : ${controller.keterangan}");
                            controller.doTambahTransaksi();
                            // Get.back();
                          },
                        ),
                      ],
                    ),
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
