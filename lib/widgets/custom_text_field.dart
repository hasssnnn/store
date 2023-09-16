// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.labelText,
      this.onChanged,
      this.obscureText = false,
      this.textInputType});
  Function(String)? onChanged;
  String? labelText;
  TextInputType? textInputType;

  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: obscureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
