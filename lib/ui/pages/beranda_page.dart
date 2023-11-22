import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simedit/controllers/home_controller.dart';

class BerandaPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Beranda Page",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
