import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SiMedit/controllers/profile_controller.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/pages/login_page.dart';
import 'package:SiMedit/ui/pages/profile_edit_page.dart';
import 'package:SiMedit/ui/pages/profile_help_page.dart';
import 'package:SiMedit/ui/pages/profile_reset_page.dart';
import 'package:SiMedit/ui/pages/widgets/profile_menu_item.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Saya",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 37),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: whiteColor,
            ),
            child: Column(
              children: [
                Container(
                  width: 137,
                  height: 144,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/avatar.png',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(46),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Erico Astama',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_person.png',
                  title: 'Edit Profile',
                  onTap: () {
                    Get.to(() => ProfileEditPage());
                  },
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_shield.png',
                  title: 'Reset Password',
                  onTap: () {
                    Get.to(() => ProfileResetPage());
                  },
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_help.png',
                  title: 'Pusat Bantuan',
                  onTap: () {
                    Get.to(() => ProfileHelpPage());
                  },
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_logout.png',
                  title: 'Log out',
                  textColor: redColor,
                  onTap: () {
                    Get.to(() => LoginPage());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
