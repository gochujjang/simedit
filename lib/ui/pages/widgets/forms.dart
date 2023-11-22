import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SiMedit/controllers/transaksi_controller.dart';
import 'package:SiMedit/theme.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  const InputField({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // input username
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: darkGreyTextStyle.copyWith(
              fontWeight: regular,
              color: greyColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: greyColor, // Set the default border color
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: blueColor,
                )),
            contentPadding: const EdgeInsets.only(
              top: 12,
              bottom: 12,
              left: 20,
            ),
          ),
        ),
      ],
    );
  }
}
