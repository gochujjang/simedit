import 'package:flutter/material.dart';
import 'package:SiMedit/controllers/shared/format_currency.dart';
import 'package:SiMedit/theme.dart';

class HeaderTransaksi extends StatelessWidget {
  const HeaderTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: blueColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sisa Uang Kamu',
            style: font_regular.copyWith(
              fontSize: 16,
              color: whiteColor,
            ),
          ),
          Text(
            formatCurrency(3080000),
            style: font_semiBold.copyWith(
              fontSize: 30,
              color: whiteColor,
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
