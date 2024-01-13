import 'package:SiMedit/controllers/portofolio_controller.dart';
import 'package:SiMedit/services/porto_service.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortofolioTambahController extends GetxController {
  // PortofolioController portoController = Get.put(PortofolioController());
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    super.onInit();
    getListPorto();
    update();
  }

  RxList<Map<String, dynamic>> listUserPorto = <Map<String, dynamic>>[].obs;

  var selectedItem = "".obs;

  void updateSelectedItem(String value) {
    selectedItem.value = value;
  }

  Future<void> getListPorto() async {
    try {
      List<Map<String, dynamic>> dropdownItems =
          await PortoService().getDropdown();
      listUserPorto.assignAll(dropdownItems);
      update(); // Trigger a UI update
    } on Exception catch (err) {
      print(err);
    }
  }

  var isStatusActive = false.obs;
  String? nominal;
  String? porto_id;
  String? status = 'pemasukan';

  doTambahTransaksi() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    bool isSuccess = await PortoService().tambah(
      nominal: nominal!,
      porto_id: porto_id!,
      status: status!,
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

      // portoController.getPortofolio();
      // portoController.doTotal();

      update();
      Get.off(() => HomePage(), arguments: 2);
    }
  }
}
