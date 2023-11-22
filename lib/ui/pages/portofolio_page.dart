import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simedit/controllers/portofolio_controller.dart';

class PortofolioPage extends GetView<PortofolioController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Portofolio Page",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
