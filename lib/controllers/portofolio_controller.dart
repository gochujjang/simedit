import 'package:SiMedit/controllers/portofolio_tambah_controller.dart';
import 'package:SiMedit/services/porto_service.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortofolioController extends GetxController {
  final formKey = GlobalKey<FormState>();
  PortofolioTambahController portoAddController =
      Get.put(PortofolioTambahController());
  @override
  void onInit() {
    super.onInit();
    getPortofolio();
    doTotal();
    portoAddController.getListPorto();
    update();
  }

  RxList<dynamic> allPorto = <dynamic>[].obs;
  Future<void> getPortofolio() async {
    try {
      allPorto.assignAll(await PortoService().get());
      update();
    } on Exception catch (err) {
      print(err);
    }
  }

  String? title;
  String? target;
  doTambahPorto() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    bool isSuccess = await PortoService().createPorto(
      title: title!,
      target: target!,
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

      await getPortofolio(); // Wait for getPortofolio to complete
      await portoAddController
          .getListPorto(); // Wait for getListPorto to complete
      doTotal();

      update();
      Get.off(() => HomePage(), arguments: 2);
    }
  }

  var totalPorto = 0.obs;
  var totalTarget = 0.obs;
  doTotal() async {
    try {
      totalPorto.value = await PortoService().getTotalPorto();
      totalTarget.value = await PortoService().getTotalTarget();
    } on Exception catch (err) {
      print(err);
    }
  }
}
