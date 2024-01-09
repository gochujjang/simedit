import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/buttons.dart';
import '../../widgets/forms.dart';

class PortofolioTambahPage extends StatelessWidget {
  const PortofolioTambahPage({super.key});

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
          'Tambah Portofolio',
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
          InputField(
            title: 'Nama Portofolio',
            hintText: 'Masukkan tujuan portofolio..',
          ),
          const SizedBox(
            height: 16,
          ),
          InputFieldNumber(
            title: 'Total Target',
            hintText: 'Masukkan total target..',
          ),
          const SizedBox(
            height: 30,
          ),
          PrimaryIconButton(
            title: 'Tambah Portofolio',
            onPressed: () {
              Get.back();
            },
          ),
          // Container(
          //   padding: EdgeInsets.all(22),
          //   decoration: BoxDecoration(
          //     color: whiteColor,
          //     borderRadius: BorderRadius.circular(20),
          //     boxShadow: [
          //       themeShadow,
          //     ],
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       // input username
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
