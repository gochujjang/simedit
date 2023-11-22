import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simedit/controllers/bindings/home_binding.dart';
import 'package:simedit/ui/pages/home_page.dart';
import 'package:simedit/ui/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialBinding: HomeBinding(),
    );
  }
}
