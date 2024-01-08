import 'package:SiMedit/models/faq.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqController extends GetxController {
  var faqs = <Faq>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list of FAQs
    faqs.assignAll(getFaqs());
  }

  void toggleItem(int index) {
    faqs[index].isExpanded = !faqs[index].isExpanded;
    // print('Item $index expanded state: ${faqs[index].isExpanded}');
    update(); // Notify listeners
  }

  List<Faq> getFaqs() {
    return [
      Faq(
        'Apa itu SiMedit?',
        'SiMedit, teman keuangan mahasiswa, adalah aplikasi keren yang bantu atur duit buat kuliah dan rekreasi. Bikin kehidupan kampus jadi makin seru dan terkelola dengan baik!',
      ),
      Faq(
        'Bagaimana cara membuat portofolio baru?',
        'Masuk ke halaman portofolio dulu. Kemudian, cari tombol tambah portofolio yang berwarna biru. klik tombol itu untuk mulai menambahkan portofolio baru. Gampang banget!',
      ),
      Faq(
        'Bagaimana cara menambahkan transaksi?',
        'Untuk nambahin transaksi, bisa di halaman mana aja selain portofolio. Coba cari tombol biru bulat. Nah, begitu diklik, kamu bisa langsung masukin detail transaksi baru!',
      ),
      Faq(
        'Bagaimana cara menambahkan dana untuk portofolio?',
        'Di halaman portofolio, tombol biru bulat tambah akan bawa kamu ke halaman transaksi portofolio. Dari sana, bisa langsung tambah dana ke portofolio dengan instruksi yang mudah dipahami.',
      ),
      Faq(
        'Jika ada pertanyaan lebih lanjut',
        'Jika anda memiliki pertanyaan lebih lanjut, silahkan kontak kami di \n\nEmail : eldwn777@gmail.com',
      ),
    ];
  }
}
