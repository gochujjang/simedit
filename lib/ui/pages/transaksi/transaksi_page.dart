import 'package:SiMedit/ui/widgets/dropdown.dart';
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
                          top: 45,
                        ),
                        child: QDropdownField(
                          label: "",
                          value: "Semua transaksi",
                          items: [
                            {
                              "label": "Semua transaksi",
                              "value": "Semua transaksi",
                            },
                            {
                              "label": "Hari ini",
                              "value": "Hari ini",
                            },
                            {
                              "label": "Bulan ini",
                              "value": "Bulan ini",
                            },
                            // Add more items as needed
                          ],
                          onChanged: (value, label) {
                            controller.filter = value;
                            controller.filterTransactions();
                          },
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
                                itemCount: controller.filteredTransaksi.length,
                                itemBuilder: (context, index) {
                                  var transaksiData =
                                      controller.filteredTransaksi[index];
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
                                  final tgl = transaksiData['tgl'] != null
                                      ? DateFormat('dd-MM-yyyy').format(
                                          DateTime.parse(transaksiData['tgl']))
                                      : 'Data tidak tersedua';
                                  final jam = transaksiData['created_at'] !=
                                          null
                                      ? DateFormat('HH:mm').format(
                                          DateTime.parse(
                                                  transaksiData['created_at'])
                                              .toLocal(),
                                        )
                                      : 'null';

                                  return TransaksiCard(
                                    title: title,
                                    nominal: nominal,
                                    status:
                                        status == 'pemasukan' ? true : false,
                                    tanggal: tgl,
                                    jam: jam,
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
