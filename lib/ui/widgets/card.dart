import 'package:flutter/material.dart';
import 'package:SiMedit/controllers/shared/format_currency.dart';
import 'package:SiMedit/theme.dart';

class TransaksiCard extends StatelessWidget {
  final String title;
  final String tanggal;
  final int nominal;
  final bool status;

  const TransaksiCard({
    Key? key,
    required this.title,
    this.tanggal = "10-05-2023, 12:12",
    this.nominal = 500000,
    this.status = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83,
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        boxShadow: [
          themeShadow,
        ],
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              status == true
                  ? Image.asset(
                      "assets/ic_transaksi_pemasukan.png",
                      height: 28,
                      width: 28,
                    )
                  : Image.asset(
                      "assets/ic_transaksi_pengeluaran.png",
                      height: 28,
                      width: 28,
                    ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: font_semiBold.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    tanggal,
                    style: font_regular.copyWith(
                      color: greyColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            formatCurrency(nominal),
            style: font_semiBold.copyWith(
              fontSize: 14,
              color: status == true ? greenColor : redColor,
            ),
          ),
        ],
      ),
    );
  }
}

class TransaksiTotalCard extends StatelessWidget {
  const TransaksiTotalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      margin: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 164,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 34,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: darkGreyColor.withOpacity(0.3), blurRadius: 10.0),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pendapatan',
                style: font_regular.copyWith(
                  fontSize: 14,
                ),
              ),
              Text(
                formatCurrency(3500000),
                style: font_semiBold.copyWith(
                  fontSize: 16,
                  color: greenColor,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pengeluaran',
                style: font_regular.copyWith(
                  fontSize: 14,
                ),
              ),
              Text(
                formatCurrency(420000),
                style: font_semiBold.copyWith(
                  fontSize: 16,
                  color: redColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MiniPortofolioCard extends StatelessWidget {
  final String title;
  final double persen;

  const MiniPortofolioCard({
    Key? key,
    required this.title,
    this.persen = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          themeShadow,
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: font_semiBold
              ),
              const Spacer(),
              Text(
                '${(persen * 100).round()}%',
                style: font_semiBold.copyWith(
                  color: greenColor
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          LinearProgressIndicator(
            value: persen,
            valueColor: AlwaysStoppedAnimation(greenColor),
            backgroundColor: bgColor,
            borderRadius: BorderRadius.circular(30),
            minHeight: 5,
          ),
        ],
      ),
    );
  }
}

class PortofolioCard extends StatelessWidget {
  final String title;
  final double persen;
  final int terkumpul;
  final int target;

  const PortofolioCard({
    Key? key,
    required this.title,
    this.persen = 0.0,
    this.terkumpul = 5500000,
    this.target = 10000000,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 144,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: darkGreyColor.withOpacity(0.2), blurRadius: 5.0),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: font_semiBold.copyWith(
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Text(
                '${(persen * 100).round()}%',
                style: font_semiBold.copyWith(
                  color: greenColor
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          LinearProgressIndicator(
            value: persen,
            valueColor: AlwaysStoppedAnimation(greenColor),
            backgroundColor: bgColor,
            borderRadius: BorderRadius.circular(30),
            minHeight: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dana Terkumpul',
                    style: font_regular.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    formatCurrency(terkumpul),
                    style: font_semiBold.copyWith(
                      color: greenColor
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Total Target',
                    style: font_regular.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    formatCurrency(target),
                    style: font_semiBold.copyWith(
                      color: greyColor,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
