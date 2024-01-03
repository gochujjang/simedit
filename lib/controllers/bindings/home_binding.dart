import 'package:SiMedit/controllers/faq_controller.dart';
import 'package:get/get.dart';
import 'package:SiMedit/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FaqController>(() => FaqController());
  }
}
