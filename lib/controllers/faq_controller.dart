import 'package:SiMedit/models/Employee.dart';
import 'package:get/get.dart';

class FaqController extends GetxController {
  late List<Employee> employee;

  @override
  void onInit() {
    super.onInit();
    employee = generateItems(5);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  List<Employee> generateItems(int numberOfItems) {
    return List.generate(numberOfItems, (int index) {
      return Employee(
        header: 'Bantuan - $index',
        body: 'Bantuan - $index Details',
        isExpanded: false.obs,
      );
    });
  }
}
