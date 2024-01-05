import 'package:SiMedit/controllers/transaksi_controller.dart';
import 'package:flutter/material.dart';
import 'package:SiMedit/controllers/shared/format_currency.dart';
import 'package:SiMedit/theme.dart';
import 'package:get/get.dart';

class HeaderTransaksi extends GetView<TransaksiController> {
  // const HeaderTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    var totalUang = controller.totalUang;
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: blueColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sisa Uang Kamu',
            style: font_regular.copyWith(
              fontSize: 16,
              color: whiteColor,
            ),
          ),
          Obx(() => Text(
                formatCurrency(totalUang.value),
                style: font_semiBold.copyWith(
                  fontSize: 30,
                  color: whiteColor,
                ),
              )),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
