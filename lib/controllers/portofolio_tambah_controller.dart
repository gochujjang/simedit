import 'package:SiMedit/controllers/portofolio_controller.dart';
import 'package:SiMedit/services/porto_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortofolioTambahController extends GetxController {
  PortofolioController portoController = Get.put(PortofolioController());
  final PortoService _portoService = PortoService();
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
  String? status = 'pemasukan';
  String? nominal;
  String? porto_id;
}
