import 'package:SiMedit/controllers/portofolio_controller.dart';
import 'package:SiMedit/ui/widgets/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/buttons.dart';
import '../../widgets/forms.dart';

class PortofolioTambahPage extends StatelessWidget {
  // const PortofolioTambahPage({super.key});
  PortofolioController controller = Get.put(PortofolioController());

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              InputField(
                title: 'Nama Portofolio',
                hintText: 'Masukkan tujuan portofolio..',
                validator: Validator.required,
                onChange: (value) {
                  controller.title = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              InputFieldNumber(
                title: 'Total Target',
                hintText: 'Masukkan total target..',
                validator: Validator.required,
                onChange: (value) {
                  controller.target = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              PrimaryIconButton(
                title: 'Tambah Portofolio',
                onPressed: () {
                  final formattedNominal =
                      controller.target?.replaceAll(".", "");
                  controller.target = formattedNominal;

                  controller.doTambahPorto();
                  // Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
