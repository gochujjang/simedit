import 'package:SiMedit/controllers/transaksi_controller.dart';
import 'package:SiMedit/services/transaksi_service.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransaksiTambahController extends GetxController {
  TransaksiController transaksiController = Get.put(TransaksiController());
  final formKey = GlobalKey<FormState>();

  var isStatusActive = false.obs;
  String? status = 'pemasukan';
  String? nominal;
  String? tanggal = DateTime.now().toString();
  String? keterangan;

  doTambahTransaksi() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    bool isSuccess = await TransaksiService().create(
      status: status!,
      nominal: nominal!,
      tanggal: tanggal!,
      keterangan: keterangan!,
    );

    if (!isSuccess) {
      Get.snackbar(
        'Error',
        'Data tidak terkirim',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
      return;
    } else {
      Get.snackbar(
        'Success',
        'Berhasil Menambah Transaksi',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: greenColor,
      );

      transaksiController.doTotalUang();
      transaksiController.doIncome();
      transaksiController.doExpense();
      transaksiController.getTransaksi();

      update();
      Get.off(() => HomePage(), arguments: 1);
    }
  }
}
