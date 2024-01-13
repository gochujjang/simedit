import 'package:SiMedit/services/auth_service.dart';
import 'package:SiMedit/services/profile_service.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/pages/home_page.dart';
import 'package:SiMedit/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  // Initialize GetStorage instance
  final box = GetStorage();
  final formKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();

  @override
  void onInit() {
    super.onInit();
    getProfiles();
    update();
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
  RxBool isUpdatingProfile = false.obs;

  String? name;
  String? email;
  String? username;

  Future<void> getProfiles() async {
    try {
      profile.value = await ProfileService().get();
      name = profile['name'];
      email = profile['email'];
      username = profile['username'];

      update();
    } catch (e) {
      print('Error fetching profiles: $e');
      // Handle error as needed
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String username,
  }) async {
    try {
      isUpdatingProfile.value = true;

      await ProfileService().update(
        name: name!,
        email: email!,
        username: username!,
      );

      profile['name'] = name;
      profile['email'] = email;
      profile['username'] = username;
      update();

      // Show success message or handle success as needed
      Get.snackbar(
        'Success',
        'Profile Update Successful',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: greenColor,
      );
      await getProfiles();
      update();
      Get.off(() => HomePage(), arguments: 3);
    } catch (e) {
      print('Error updating profile: $e');
      // Handle error as needed
      Get.snackbar(
        'Error',
        'Profile Update Failed',
        snackPosition: SnackPosition.TOP,
        colorText: redColor,
        backgroundColor: whiteColor,
      );
    } finally {
      // Set isUpdatingProfile to false when the update is completed
      isUpdatingProfile.value = false;
    }
  }

  RxBool isUpdatingPassword = false.obs;

  String? password;
  String? password_confirmation;
  String? current_password;

  RxMap reset = {}.obs;

  updatePassword() async {
    Get.focusScope!.unfocus();
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    // isUpdatingPassword.value = true;
    String? isSuccess = await ProfileService().resetpass(
      password: password!,
      password_confirmation: password_confirmation!,
      current_password: current_password!,
    );

    // Notify listeners (if necessary)
    update();

    if (isSuccess != "Reset Password Success") {
      Get.snackbar(
        'Error',
        'Check kembali password anda',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
      return;
    } else {
      Get.snackbar(
        'Success',
        'Password berhasil diganti',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: greenColor,
      );
      Get.off(() => HomePage(), arguments: 3);
    }

    // Set isUpdatingProfile to false when the update is completed
    // isUpdatingPassword.value = false;
  }
}
