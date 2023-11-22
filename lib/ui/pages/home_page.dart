import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simedit/controllers/home_controller.dart';
import 'package:simedit/theme.dart';
import 'package:simedit/ui/pages/beranda_page.dart';
import 'package:simedit/ui/pages/portofolio_page.dart';
import 'package:simedit/ui/pages/profile_page.dart';
import 'package:simedit/ui/pages/transaksi_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              BerandaPage(),
              TransaksiPage(),
              PortofolioPage(),
              ProfilePage(),
            ],
          ),
        ),
        backgroundColor: bgColor,
        bottomNavigationBar: BottomAppBar(
          color: whiteColor,
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          notchMargin: 6,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: blueColor,
          child: Image.asset(
            'assets/ic_plus_circle.png',
            height: 24,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
