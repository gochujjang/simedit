import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/pages/home_page.dart';
import 'package:SiMedit/ui/pages/register_page.dart';
import 'package:SiMedit/ui/pages/widgets/buttons.dart';
import 'package:SiMedit/ui/pages/widgets/forms.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            style: darkBlueTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          Text(
            'Masukkan username dan password',
            style: darkBlueTextStyle.copyWith(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // input username
                InputField(
                  title: 'Username',
                  hintText: 'Masukkan username...',
                ),
                const SizedBox(
                  height: 16,
                ),
                //password
                InputField(
                  title: 'Password',
                  hintText: 'Masukkan password...',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 48,
                ),
                PrimaryButton(
                  title: 'Login',
                  onPressed: () {
                    Get.off(() => HomePage());
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          CustomTextButton(
            title: 'Registrasi Akun',
            onPressed: () {
              Get.to(() => RegisterPage());
            },
          ),
        ],
      ),
    );
  }
}
