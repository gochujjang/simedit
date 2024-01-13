import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QDropdownField extends StatefulWidget {
  final String label;
  final RxList<dynamic> items;
  final dynamic value;
  final Function(dynamic, String?) onChanged;

  QDropdownField({
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  _QDropdownFieldState createState() => _QDropdownFieldState();
}

class _QDropdownFieldState extends State<QDropdownField> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Map<String, dynamic>>(
      value: widget.value,
      onChanged: (Map<String, dynamic>? value) {
        if (value != null) {
          String? label = value["label"];
          widget.onChanged(value["value"], label);
        }
      },
      items: widget.items.map<DropdownMenuItem<Map<String, dynamic>>>((item) {
        return DropdownMenuItem<Map<String, dynamic>>(
          value: item,
          child: Text(item["label"].toString()),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: widget.label,
      ),
    );
  }
}
