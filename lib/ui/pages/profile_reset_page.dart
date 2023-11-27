import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SiMedit/theme.dart';

import 'widgets/buttons.dart';
import 'widgets/forms.dart';

class ProfileResetPage extends StatelessWidget {
  const ProfileResetPage({super.key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // input username
                InputField(
                  title: 'Password Lama',
                  hintText: 'Masukkan password lama...',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                InputField(
                  title: 'Password Baru',
                  hintText: 'Masukkan password baru...',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                InputField(
                  title: 'Konfirmasi Password',
                  hintText: 'Masukkan kembali password...',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 30,
                ),
                PrimaryButton(
                  title: 'Perbarui Password',
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
