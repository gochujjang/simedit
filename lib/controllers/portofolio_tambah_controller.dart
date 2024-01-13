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
    print(listUserPorto);
    update();
  }

  RxList<dynamic> listUserPorto = <dynamic>[].obs;

  var selectedItem = "".obs;

  void updateSelectedItem(String value) {
    selectedItem.value = value;
  }

  Future<void> getListPorto() async {
    try {
      listUserPorto.assignAll(await PortoService().getDropdown());
    } on Exception catch (err) {
      print(err);
    }
  }
  

  var isStatusActive = false.obs;
  String? status = 'pemasukan';
  String? nominal;
  String? porto_id;
}
