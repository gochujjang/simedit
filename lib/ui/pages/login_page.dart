import 'package:SiMedit/controllers/login_controller.dart';
import 'package:SiMedit/ui/widgets/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/pages/register_page.dart';
import 'package:SiMedit/ui/widgets/buttons.dart';
import 'package:SiMedit/ui/widgets/forms.dart';

class LoginPage extends GetView<LoginController> {
  // const LoginPage({super.key});
  LoginController controller = Get.put(LoginController());

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.only(
              top: 100,
              bottom: 64,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo_text.png'),
              ),
            ),
          ),
          Text(
            'Login',
            style: font_semiBold.copyWith(
              color: darkBlueColor,
              fontSize: 16,
            ),
          ),
          Text(
            'Masukkan username dan password',
            style: font_regular.copyWith(
              fontWeight: regular,
              color: darkGreyColor,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.all(22),
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
                    title: 'Username',
                    hintText: 'Masukkan username...',
                    controller: usernameController,
                    validator: Validator.required,
                    onChange: (value) {
                      controller.username = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //password
                  InputFieldPassword(
                    title: 'Password',
                    hintText: 'Masukkan password...',
                    validator: Validator.required,
                    controller: passwordController,
                    onChange: (value) {
                      controller.password = value;
                    },
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  PrimaryButton(
                    title: 'Login',
                    onPressed: () {
                      controller.onLogin();
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          CustomTextButton(
            title: 'Registrasi Akun',
            onPressed: () {
              Get.off(() => RegisterPage());
            },
          ),
        ],
      ),
    );
  }
}
