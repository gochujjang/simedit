import 'package:SiMedit/services/profile_service.dart';
import 'package:SiMedit/ui/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  // Initialize GetStorage instance
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getProfiles();
  }

  // Method to logout and remove token
  void logout() {
    // Remove the token from GetStorage
    box.remove('token');
    Get.offAll(LoginPage());
  }

  RxMap profile = {}.obs;
  Future<void> getProfiles() async {
    try {
      profile.value = await ProfileService().get();
      print(profile);
      update();
    } catch (e) {
      print('Error fetching profiles: $e');
      // Handle error as needed
    }
  }
}
