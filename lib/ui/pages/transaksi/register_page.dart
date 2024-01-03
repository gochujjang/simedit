import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/widgets/buttons.dart';
import 'package:SiMedit/ui/widgets/forms.dart';

import '../home_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // input username
                InputField(
                  title: 'Nama',
                  hintText: 'Masukkan nama anda...',
                ),
                const SizedBox(
                  height: 16,
                ),
                InputField(
                  title: 'Username',
                  hintText: 'Masukkan username...',
                ),
                const SizedBox(
                  height: 16,
                ),
                InputField(
                  title: 'Email',
                  hintText: 'Masukkan email...',
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
