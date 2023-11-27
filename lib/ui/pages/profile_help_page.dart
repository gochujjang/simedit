import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHelpPage extends StatelessWidget {
  const ProfileHelpPage({super.key});

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
          'Pusat Bantuan',
        ),
      ),
    );
  }
}
