import 'package:SiMedit/ui/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  // Initialize GetStorage instance
  final box = GetStorage();

  // Method to logout and remove token
  void logout() {
    // Remove the token from GetStorage
    box.remove('token');
    Get.offAll(LoginPage());
  }
}
