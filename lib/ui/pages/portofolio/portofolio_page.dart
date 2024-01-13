import 'package:SiMedit/controllers/portofolio_tambah_controller.dart';
import 'package:SiMedit/ui/pages/portofolio/portofolio_tambah_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SiMedit/controllers/portofolio_controller.dart';
import 'package:SiMedit/controllers/shared/format_currency.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/widgets/card.dart';

import '../../widgets/buttons.dart';

class PortofolioPage extends GetView<PortofolioController> {
  PortofolioController controller = Get.put(PortofolioController());
  PortofolioTambahController portoAddController =
      Get.put(PortofolioTambahController());
  Future<void> _onRefresh() async {
    await controller.doTotal();
    await controller.getPortofolio();
    await portoAddController.getListPorto();
  }

  @override
  Widget build(BuildContext context) {
    var totalPorto = controller.totalPorto;
    var totalTarget = controller.totalTarget;
    return Scaffold(
        backgroundColor: blueColor,
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView(
            children: [
              const SizedBox(
                height: 35,
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 140,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nilai Portofolio',
                              style: font_regular.copyWith(
                                color: whiteColor,
                                fontSize: 16,
                              ),
                            ),
                            Obx(() => Text(
                                  formatCurrency(totalPorto.value),
                                  style: font_semiBold.copyWith(
                                    color: whiteColor,
                                    fontSize: 24,
                                  ),
                                )),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Target',
                              style: font_regular.copyWith(
                                color: whiteColor,
                                fontSize: 16,
                              ),
                            ),
                            Obx(() => Text(
                                  formatCurrency(totalTarget.value),
                                  style: font_semiBold.copyWith(
                                    color: whiteColor,
                                    fontSize: 14,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      decoration: BoxDecoration(
                        color: bgColor,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          PrimaryIconButton(
                            title: 'Tambah Portofolio',
                            onPressed: () {
                              Get.to(PortofolioTambahPage());
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Obx(
                            () => controller.allPorto.isEmpty
                                ? Container(
                                    height: MediaQuery.of(context).size.height -
                                        400,
                                    child: Text(
                                      "Data tidak ditemukan\nSilahkan tambah transaksi",
                                      textAlign: TextAlign.center,
                                      style: font_medium.copyWith(
                                        color: darkGreyColor,
                                      ),
                                    ),
                                  )
                                :
                                // list porto
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: controller.allPorto.length,
                                    itemBuilder: (context, index) {
                                      var dataPorto =
                                          controller.allPorto[index];
                                      final title = dataPorto['title'] != null
                                          ? dataPorto['title']
                                          : 'Data tidak tersedia';
                                      final persen =
                                          dataPorto['persentase'] != null
                                              ? double.parse(
                                                  dataPorto['persentase'])
                                              : 0.0;
                                      final terkumpul =
                                          dataPorto['terkumpul'] != null
                                              ? int.parse(dataPorto['terkumpul']
                                                  .toString())
                                              : 0;
                                      final target = dataPorto['target'] != null
                                          ? int.parse(
                                              dataPorto['target'].toString())
                                          : 0;

                                      return PortofolioCard(
                                        title: title,
                                        persen: persen,
                                        terkumpul: terkumpul,
                                        target: target,
                                      );
                                    },
                                  ),
                          ),
                          const SizedBox(
                            height: 250,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
