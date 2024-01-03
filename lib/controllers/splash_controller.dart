import 'package:SiMedit/ui/pages/home_page.dart';
import 'package:SiMedit/ui/pages/onboarding_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    String? savedToken = box.read("token");
    print("Saved token from GetStorage: $savedToken");

    if (savedToken != null) {
      Future.delayed(
        const Duration(seconds: 5),
        () {
          Get.off(HomePage());
        },
      );
    } else {
      Get.offAll(OnboardingPage());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
