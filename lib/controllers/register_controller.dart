import 'package:SiMedit/services/auth_service.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? name;
  String? username;
  String? email;
  String? password;

  Future doRegister() async {
    Get.focusScope!.unfocus();

    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    bool isSuccess = await AuthService().register(
      name: name!,
      username: username!,
      email: email!,
      password: password!,
    );

    if (!isSuccess) {
      Get.snackbar(
        'Error',
        'Registrasi belum berhasil',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
      return;
    } else {
      Get.snackbar(
        'Success',
        'Akun berhasil dibuat!',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: greenColor,
      );

      Get.off(() => LoginPage());
    }
  }
}
