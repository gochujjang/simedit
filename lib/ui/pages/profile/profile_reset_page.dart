import 'package:SiMedit/controllers/profile_controller.dart';
import 'package:SiMedit/ui/widgets/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SiMedit/theme.dart';

import '../../widgets/buttons.dart';
import '../../widgets/forms.dart';

class ProfileResetPage extends StatelessWidget {
  // const ProfileResetPage({super.key});
  ProfileController controller = Get.put(ProfileController());

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(
            'assets/ic_back.png',
            width: 24,
            height: 24,
          ),
        ),
        title: Text(
          'Reset Password',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                themeShadow,
              ],
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // input username
                  InputFieldPassword(
                    title: 'Password Lama',
                    hintText: 'Masukkan password lama...',
                    controller: oldPasswordController,
                    validator: Validator.required,
                    onChange: (value) {
                      controller.current_password = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputFieldPassword(
                    title: 'Password Baru',
                    hintText: 'Masukkan password baru...',
                    controller: newPasswordController,
                    validator: Validator.password,
                    onChange: (value) {
                      controller.password = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputFieldPassword(
                    title: 'Konfirmasi Password',
                    hintText: 'Masukkan kembali password...',
                    controller: confirmPasswordController,
                    validator: Validator.required,
                    onChange: (value) {
                      controller.password_confirmation = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  PrimaryButton(
                    title: 'Perbarui Password',
                    onPressed: controller.isUpdatingPassword.value
                        ? null
                        : () {
                            // print("name : ${controller.name}");
                            print("1password: ${controller.password}");
                            print(
                                "1password_confirmation: ${controller.password_confirmation}");
                            print(
                                "1current_password: ${controller.current_password}");

                            controller.updatePassword();
                          },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
