import 'package:get/get.dart';

class DropdownListController extends GetxController {
  var selectedItem = "".obs;

  void updateSelectedItem(String value) {
    selectedItem.value = value;
  }
}
