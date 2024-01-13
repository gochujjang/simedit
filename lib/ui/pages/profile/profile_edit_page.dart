import 'package:SiMedit/controllers/profile_controller.dart';
import 'package:SiMedit/ui/widgets/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/widgets/forms.dart';

import '../../widgets/buttons.dart';

class ProfileEditPage extends StatelessWidget {
  // const ProfileEditPage({super.key});
  ProfileController controller = Get.put(ProfileController());

  final Map? itemProfile;
  ProfileEditPage({
    Key? key,
    this.itemProfile,
  }) : super(key: key);

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
          'Edit Profile',
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
                  InputField(
                    title: 'Nama Lengkap',
                    hintText: 'Masukkan nama anda...',
                    validator: Validator.required,
                    value: controller.name,
                    onChange: (value) {
                      controller.name = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputField(
                    title: 'Username',
                    hintText: 'Masukkan username...',
                    validator: Validator.required,
                    value: controller.username,
                    onChange: (value) {
                      controller.username = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputField(
                    title: 'Email',
                    hintText: 'Masukkan email...',
                    validator: Validator.email,
                    value: controller.email,
                    onChange: (value) {
                      controller.email = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  PrimaryButton(
                    title: 'Perbarui Profile',
                    onPressed: controller.isUpdatingProfile.value
                        ? null
                        : () {
                            controller.updateProfile(
                              name: controller.name!,
                              email: controller.email!,
                              username: controller.username!,
                            );
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
