import 'package:SiMedit/ui/pages/transaksi_tambah_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SiMedit/controllers/home_controller.dart';
import 'package:SiMedit/theme.dart';
import 'package:SiMedit/ui/pages/beranda_page.dart';
import 'package:SiMedit/ui/pages/portofolio_page.dart';
import 'package:SiMedit/ui/pages/profile_page.dart';
import 'package:SiMedit/ui/pages/transaksi_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            BerandaPage(),
            TransaksiPage(),
            PortofolioPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: darkGreyColor.withOpacity(0.4), blurRadius: 10.0),
            ],
          ),
          child: BottomAppBar(
            elevation: 0,
            padding: EdgeInsets.zero,
            color: whiteColor,
            shape: const CircularNotchedRectangle(),
            clipBehavior: Clip.antiAlias,
            notchMargin: 7,
            child: BottomNavigationBar(
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              backgroundColor: whiteColor,
              selectedItemColor: blueColor,
              unselectedItemColor: darkGreyColor,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedLabelStyle: blueTextStyle.copyWith(
                fontSize: 10,
                fontWeight: medium,
              ),
              unselectedLabelStyle: darkGreyTextStyle.copyWith(
                fontSize: 10,
                fontWeight: medium,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.only(
                      top: 13,
                    ), // Adjust the padding as needed
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/ic_home_active.png',
                          height: 20,
                          color: controller.tabIndex == 0
                              ? blueColor
                              : darkGreyColor,
                        ),
                        SizedBox(
                          height: 4.0,
                        ), // Adjust the spacing between icon and label
                        Text(
                          'Beranda',
                          style: TextStyle(
                            color: controller.tabIndex == 0
                                ? blueColor
                                : darkGreyColor,
                            fontSize: 10,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.only(
                      top: 13,
                    ), // Adjust the padding as needed
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/ic_transaksi.png',
                          height: 20,
                          color: controller.tabIndex == 1
                              ? blueColor
                              : darkGreyColor,
                        ),
                        SizedBox(
                            height:
                                4.0), // Adjust the spacing between icon and label
                        Text(
                          'Transaksi',
                          style: TextStyle(
                            color: controller.tabIndex == 1
                                ? blueColor
                                : darkGreyColor,
                            fontSize: 10,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(), // Empty container as spacer
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.only(
                      top: 13,
                    ), // Adjust the padding as needed
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/ic_portofolio.png',
                          height: 20,
                          color: controller.tabIndex == 2
                              ? blueColor
                              : darkGreyColor,
                        ),
                        SizedBox(
                            height:
                                4.0), // Adjust the spacing between icon and label
                        Text(
                          'Portofolio',
                          style: TextStyle(
                            color: controller.tabIndex == 2
                                ? blueColor
                                : darkGreyColor,
                            fontSize: 10,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.only(
                      top: 13,
                    ), // Adjust the padding as needed
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/ic_profile.png',
                          height: 20,
                          color: controller.tabIndex == 3
                              ? blueColor
                              : darkGreyColor,
                        ),
                        SizedBox(
                            height:
                                4.0), // Adjust the spacing between icon and label
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: controller.tabIndex == 3
                                ? blueColor
                                : darkGreyColor,
                            fontSize: 10,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            onPressed: () {
              Get.to(TransaksiTambahPage());
            },
            backgroundColor: blueColor,
            elevation: 0,
            shape: CircleBorder(),
            child: Image.asset(
              'assets/ic_plus_circle.png',
              height: 35,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
