import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/widgets/forms.dart';

import '../home_page.dart';
import '../../widgets/buttons.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // input username
                InputField(
                  title: 'Nama Lengkap',
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
                const SizedBox(
                  height: 30,
                ),
                PrimaryButton(
                  title: 'Perbarui Profile',
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
