import 'package:SiMedit/services/auth_service.dart';
import 'package:SiMedit/services/profile_service.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  // Initialize GetStorage instance
  final box = GetStorage();
  final AuthService authService = AuthService();

  @override
  void onInit() {
    super.onInit();
    getProfiles();
  }

  // Method to logout and remove token
  void logout() async {
    bool logoutSuccess = await authService.logout();
    // Remove the token from GetStorage
    if (logoutSuccess) {
      // Clear local storage
      Get.snackbar(
        'Success',
        'Berhasil Logout',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: greenColor,
      );
      box.erase();

      // Navigate to the login page or perform other actions
      Get.offAll(() => LoginPage());
    } else {
      // Handle logout failure (display an error message, etc.)
      print('Logout failed');
    }
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
