import 'package:SiMedit/controllers/register_controller.dart';
import 'package:SiMedit/ui/pages/login_page.dart';
import 'package:SiMedit/ui/widgets/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/widgets/buttons.dart';
import 'package:SiMedit/ui/widgets/forms.dart';

import 'home_page.dart';

class RegisterPage extends GetView<RegisterController> {
  // const RegisterPage({super.key});
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            width: 123,
            height: 29,
            margin: const EdgeInsets.only(
              top: 75,
              bottom: 27,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo_text.png'),
              ),
            ),
          ),
          Text(
            'Registrasi',
            style: font_semiBold.copyWith(
              color: darkBlueColor,
              fontSize: 16,
            ),
          ),
          Text(
            'Masukkan data yang sesuai',
            style: font_regular.copyWith(
              color: darkGreyColor,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: darkGreyColor.withOpacity(0.2),
                  blurRadius: 10.0,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // input username
                  InputField(
                    title: 'Nama',
                    hintText: 'Masukkan nama anda...',
                    validator: Validator.required,
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
                    validator: Validator.required,
                    onChange: (value) {
                      controller.email = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputFieldPassword(
                    title: 'Password',
                    hintText: 'Masukkan password...',
                    validator: Validator.required,
                    onChange: (value) {
                      controller.password = value;
                    },
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  PrimaryButton(
                    title: 'Daftar',
                    onPressed: () {
                      controller.doRegister();
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextButton(
            title: 'Login Sekarang',
            onPressed: () {
              Get.off(() => LoginPage());
            },
          ),
        ],
      ),
    );
  }
}
