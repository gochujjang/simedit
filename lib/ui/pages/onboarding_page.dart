import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/pages/login_page.dart';
import 'package:SiMedit/ui/pages/widgets/buttons.dart';

class OnboardingPage extends StatelessWidget {
  var currentIndex = 0.obs;

  RxList<String> imageAssets = [
    'assets/img_art1.png',
    'assets/img_art2.png',
    'assets/img_art3.png',
  ].obs;

  RxList<String> title = [
    'Mencatat\nPengeluaran Uhuy',
    'Raih Tujuan\nFinansial Sekarang',
    'Kuy Gaskeun',
  ].obs;

  RxList<String> subtitle = [
    'Alokasikan uang sesuai keinginanmu jadi lebih cerdas \ndan fleksibel bareng SiMedit',
    'Lupa catat riwayat transaksi kamu?\nSekarang udah engga dong, kan udah di catat sama SiMedit',
    'Tunggu apa lagi, yuk atur keuangan kamu bareng SiMedit',
  ].obs;

  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                items: imageAssets.map((assetPath) {
                  return Image.asset(
                    assetPath,
                    height: 327,
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 331,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    // index yang diganti
                    currentIndex.value = index;
                  },
                ),
                carouselController: _carouselController,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      title[currentIndex.value],
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Text(
                      subtitle[currentIndex.value],
                      style: darkGreyTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: regular,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    currentIndex == 2
                        ? Column(
                            children: [
                              PrimaryButton(
                                title: 'Mulai Menabung',
                                onPressed: () {
                                  Get.off(() => LoginPage());
                                },
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == 0
                                      ? blueColor
                                      : lightGreyColor,
                                ),
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == 1
                                      ? blueColor
                                      : lightGreyColor,
                                ),
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == 2
                                      ? blueColor
                                      : lightGreyColor,
                                ),
                              ),
                              const Spacer(),
                              PrimaryButton(
                                title: 'Lanjut',
                                width: 150,
                                onPressed: () {
                                  _carouselController.nextPage();
                                },
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
