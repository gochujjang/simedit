import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:SiMedit/controllers/shared/dropdown_controller.dart';
import 'package:SiMedit/controllers/transaksi_controller.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/widgets/card.dart';
import 'package:SiMedit/ui/widgets/header_page.dart';

class TransaksiPage extends GetView<TransaksiController> {
  final DropdownListController dropdownListController =
      Get.put(DropdownListController());

  final List<String> dropdownList = [
    "Hari ini",
    "Bulan ini",
  ].toSet().toList();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: blueColor,
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              HeaderTransaksi(),
              Container(
                color: bgColor,
                margin: const EdgeInsets.only(top: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 66,
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
                              'Rentang Waktu',
                              style: font_regular.copyWith(
                                color: darkGreyColor,
                                fontSize: 14,
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
                            value:
                                dropdownListController.selectedItem.value == ""
                                    ? null
                                    : dropdownListController.selectedItem.value,
                            onChanged: (newValue) {
                              dropdownListController
                                  .updateSelectedItem(newValue.toString());
                            },
                            items: dropdownList.map<DropdownMenuItem<String>>(
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
                      height: 20,
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
                      height: 50,
                    ),
                  ],
                ),
              ),
              TransaksiTotalCard(),
            ],
          ),
        ],
      ),
    );
  }
}
