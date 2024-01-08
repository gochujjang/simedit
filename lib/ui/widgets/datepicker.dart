import 'package:SiMedit/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class QDatePicker extends StatefulWidget {
  final String label;
  final DateTime? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final Function(DateTime) onChanged;

  const QDatePicker({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<QDatePicker> createState() => _QDatePickerState();
}

class _QDatePickerState extends State<QDatePicker> {
  DateTime? selectedValue;
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
    controller = TextEditingController(
      text: getInitialValue(),
    );
  }

  getInitialValue() {
    initializeDateFormatting();
    if (widget.value != null) {
      return DateFormat("d MMMM y", 'id_ID').format(widget.value!);
    }
    return "-";
  }

  getFormattedValue() {
    initializeDateFormatting();
    if (selectedValue != null) {
      return DateFormat("d MMMM y", 'id_ID').format(selectedValue!);
    }
    return "-";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1600),
          lastDate: DateTime(2100),
        );
        selectedValue = pickedDate;
        controller.text = getFormattedValue();
        setState(() {});

        if (selectedValue == null) return;
        widget.onChanged(selectedValue!);
      },
      child: AbsorbPointer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.label, style: font_semiBold),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 12.0,
              ),
              child: TextFormField(
                controller: controller,
                validator: (value) {
                  if (widget.validator != null) {
                    return widget.validator!(selectedValue.toString());
                  }
                  return null;
                },
                readOnly: true,
                decoration: InputDecoration(
                  fillColor: whiteColor,
                  filled: true,
                  // labelText: widget.label,
                  // labelStyle: const TextStyle(
                  //   color: Colors.blueGrey,
                  // ),
                  suffixIcon: Icon(
                    Icons.calendar_month,
                    color: darkGreyColor,
                  ),
                  helperText: widget.helper,
                  hintText: widget.hint,
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
            ),
          ],
        ),
      ),
    );
  }
}
