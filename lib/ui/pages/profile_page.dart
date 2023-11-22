import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simedit/controllers/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Profile Page",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
  
}
