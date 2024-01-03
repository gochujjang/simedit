import 'package:SiMedit/services/auth_service.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? username;
  String? password;

  onLogin() async {
    Get.focusScope!.unfocus();
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    bool isSuccess = await AuthService().login(
      username: username!,
      password: password!,
    );

    if (!isSuccess) {
      Get.snackbar(
        'Error',
        'Wrong username or password',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
      return;
    } else {
      Get.snackbar(
        'Success',
        'Login Successful',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: greenColor,
      );
      print("login berhasil");
      Get.offAll(() => HomePage());
    }
  }
}
