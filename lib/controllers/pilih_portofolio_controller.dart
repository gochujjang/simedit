import 'package:get/get.dart';

class PilihPortofolioController extends GetxController {
  var selectedItem = "".obs;

  void updateSelectedItem(String value) {
    selectedItem.value = value;
  }
}
