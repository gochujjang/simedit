import 'package:SiMedit/controllers/shared/currency.dart';
import 'package:SiMedit/controllers/shared/datepicker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:SiMedit/controllers/transaksi_controller.dart';
import 'package:SiMedit/theme.dart';
import 'package:intl/intl.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?)? onChange;
  final String? value;
  final bool? enabled;

  const InputField({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.onChange,
    this.keyboard,
    this.value,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // input username
        Text(title, style: font_semiBold),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: obscureText,
          initialValue: value,
          controller: controller,
          enabled: enabled,
          validator: validator,
          inputFormatters: inputFormatters,
          onChanged: onChange,
          keyboardType: keyboard,
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

class InputFieldPassword extends StatelessWidget {
  final String title;
  final String hintText;
  var _obscureText = true.obs;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?)? onChange;
  final RxBool isChecked = false.obs;
  final RxBool isSwitch = false.obs;
  final String? value;

  InputFieldPassword({
    Key? key,
    required this.title,
    required this.hintText,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.onChange,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // input username
        Text(title, style: font_semiBold),
        const SizedBox(
          height: 8,
        ),
        Obx(
          () => TextFormField(
            obscureText: _obscureText.value,
            initialValue: value,
            controller: controller,
            validator: validator,
            inputFormatters: inputFormatters,
            onChanged: onChange,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  _obscureText.value = !_obscureText.value;
                },
                child: Icon(_obscureText.value
                    ? Icons.visibility
                    : Icons.visibility_off),
              ),
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
  final void Function(String?)? onChange;
  final String? Function(String?)? validator;

  const InputFieldNumber({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.onChange,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat('#,##0', 'id_ID');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // input username
        Text(title, style: font_semiBold),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          onChanged: onChange,
          obscureText: obscureText,
          controller: controller,
          validator: validator,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            FilteringTextInputFormatter.digitsOnly,
            CurrencyFormat(),
            // TextInputFormatter.withFunction((oldValue, newValue) {
            //   try {
            //     final numericValue = int.parse(newValue.text);
            //     final formattedValue = currencyFormatter.format(numericValue);
            //     return TextEditingValue(
            //       text: formattedValue,
            //       selection:
            //           TextSelection.collapsed(offset: formattedValue.length),
            //     );
            //   } catch (e) {
            //     // Handle the exception if the input cannot be parsed as an integer
            //     return oldValue;
            //   }
            // }),
          ],
          decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor,
            focusColor: whiteColor,
            hintText: hintText,
            prefixIcon: Padding(
              padding:
                  const EdgeInsets.only(top: 15, left: 5, right: 0, bottom: 15),
              child: SizedBox(
                height: 4,
                child: Image.asset(
                  "assets/ic_rupiah.png",
                  color: darkGreyColor,
                ),
              ),
            ),
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
        Text(title, style: font_semiBold),
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
