import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:SiMedit/controllers/shared/dropdown_controller.dart';
import 'package:SiMedit/controllers/transaksi_controller.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/widgets/card.dart';
import 'package:SiMedit/ui/widgets/header_page.dart';
import 'package:intl/intl.dart';

class TransaksiPage extends GetView<TransaksiController> {
  final DropdownListController dropdownListController =
      Get.put(DropdownListController());

  final List<String> dropdownList = [
    "Hari ini",
    "Bulan ini",
  ].toSet().toList();

  Future<void> _onRefresh() async {
    await controller.getTransaksi();
    await controller.doTotalUang();
    await controller.doIncome();
    await controller.doExpense();
  }

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
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                HeaderTransaksi(),
                Container(
                  height: MediaQuery.of(context).size.height - 500,
                  color: bgColor,
                  margin: const EdgeInsets.only(top: 400),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                ),
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
                              value: dropdownListController
                                          .selectedItem.value ==
                                      ""
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
                      Obx(
                        () => controller.allTransaksi.isEmpty
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.height - 400,
                                child: Text(
                                  "Data tidak ditemukan\nSilahkan tambah transaksi",
                                  textAlign: TextAlign.center,
                                  style: font_medium.copyWith(
                                    color: darkGreyColor,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.allTransaksi.length,
                                itemBuilder: (context, index) {
                                  var transaksiData =
                                      controller.allTransaksi[index];
                                  final title =
                                      transaksiData['Keterangan'] != null
                                          ? transaksiData['Keterangan']
                                          : 'Data tidak tersedia';
                                  final nominal = transaksiData['nominal'] !=
                                          null
                                      ? int.parse(
                                          transaksiData['nominal'].toString())
                                      : 0;
                                  final status = transaksiData['status'] != null
                                      ? transaksiData['status']
                                      : 'Data tidak tersedua';
                                  final tgl =
                                      transaksiData['created_at'] != null
                                          ? DateFormat('dd-MM-yyyy, HH:mm')
                                              .format(DateTime.parse(
                                                  transaksiData['created_at']))
                                          : 'Data tidak tersedua';

                                  return TransaksiCard(
                                    title: title,
                                    nominal: nominal,
                                    status:
                                        status == 'pemasukan' ? true : false,
                                    tanggal: tgl,
                                  );
                                },
                              ),
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
      ),
    );
  }
}
