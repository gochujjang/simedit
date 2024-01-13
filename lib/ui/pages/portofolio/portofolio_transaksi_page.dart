import 'package:SiMedit/controllers/pilih_portofolio_controller.dart';
import 'package:SiMedit/controllers/portofolio_controller.dart';
import 'package:SiMedit/controllers/portofolio_tambah_controller.dart';
import 'package:SiMedit/controllers/transaksi_tambah_controller.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/widgets/dropdown.dart';
import 'package:SiMedit/ui/widgets/forms.dart';
import 'package:SiMedit/ui/widgets/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_page.dart';
import '../../widgets/buttons.dart';

class PortofolioTransaksiPage extends StatelessWidget {
  final PortofolioTambahController controller =
      Get.put(PortofolioTambahController());
  final PilihPortofolioController portofolioListDropdown =
      Get.put(PilihPortofolioController());

  final PortofolioController portoController = Get.put(PortofolioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        iconTheme: IconThemeData(color: whiteColor),
        leading: IconButton(
          onPressed: () {
            Get.off(() => HomePage(), arguments: 2);
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
                                    color:
                                        controller.isStatusActive.value == false
                                            ? blueColor
                                            : Colors.transparent,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: blueColor,
                                      width: controller.isStatusActive.value ==
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
                                    color:
                                        controller.isStatusActive.value == true
                                            ? blueColor
                                            : Colors.transparent,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: controller.isStatusActive.value ==
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
                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
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
                            Obx(() {
                              var listmenu = controller.listUserPorto.value;
                              print("List User Porto: $listmenu");
                              print("pusing");
                              print(listmenu);
                              listmenu.forEach((item) {
                                print("Label: ${item["label"]}");
                              });

                              return QDropdownField(
                                label: "Pilih Portofolio",
                                validator: Validator.required,
                                items: listmenu.map((item) {
                                  return {
                                    "label": item["label"] ?? "",
                                    "value": item["value"]?.toString() ?? "",
                                  };
                                }).toList(),
                                value: "-",
                                onChanged: (value, label) {
                                  controller.porto_id = value;
                                },
                              );
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      PrimaryIconButton(
                        title: "Tambah Transaksi",
                        onPressed: () async {
                          final formattedNominal =
                              controller.nominal?.replaceAll(".", "");
                          controller.nominal = formattedNominal;

                          await controller.doTambahTransaksi();
                          await portoController.getPortofolio();
                          await portoController.doTotal();
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
