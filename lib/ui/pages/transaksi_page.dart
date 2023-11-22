import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simedit/controllers/transaksi_controller.dart';

class TransaksiPage extends GetView<TransaksiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Transaksi Page",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
