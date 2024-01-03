import 'package:SiMedit/controllers/shared/datepicker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          style: font_semiBold
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor,
            focusColor: whiteColor,
            hintText: hintText,
            hintStyle: font_regular.copyWith(
              fontSize: 14,
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

class InputFieldNumber extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  const InputFieldNumber({
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
          style: font_semiBold
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor,
            focusColor: whiteColor,
            hintText: hintText,
            hintStyle: font_regular.copyWith(
              fontSize: 14,
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

class InputFieldDate extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final DatePickerController dateController = Get.put(DatePickerController());
  final TextEditingController _dateController = TextEditingController();

  InputFieldDate({
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
          style: font_semiBold
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          obscureText: obscureText,
          controller: _dateController,
          onTap: () {
            dateController.chooseDate(_dateController);
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor,
            suffixIcon: GestureDetector(
              onTap: () => dateController.chooseDate(_dateController),
              child: Icon(
                Icons.calendar_month,
                color: darkGreyColor,
              ),
            ),
            hintText: hintText,
            hintStyle: font_regular.copyWith(
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
