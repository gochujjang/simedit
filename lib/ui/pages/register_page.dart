import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simedit/theme.dart';
import 'package:simedit/ui/pages/widgets/buttons.dart';
import 'package:simedit/ui/pages/widgets/forms.dart';

import 'home_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
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
            style: darkBlueTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          Text(
            'Masukkan data yang sesuai',
            style: darkBlueTextStyle.copyWith(
              fontWeight: regular,
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
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // input username
                InputField(
                  title: 'Nama',
                  hintText: 'Username atau email anda...',
                ),
                const SizedBox(
                  height: 16,
                ),
                InputField(
                  title: 'Username',
                  hintText: 'Masukkan password...',
                ),
                const SizedBox(
                  height: 16,
                ),
                InputField(
                  title: 'Email',
                  hintText: 'Masukkan password...',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                InputField(
                  title: 'Password',
                  hintText: 'Masukkan password...',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 48,
                ),
                PrimaryButton(
                  title: 'Daftar',
                  onPressed: () {
                    Get.off(() => HomePage());
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextButton(
            title: 'Login Sekarang',
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
