import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String label;
  final String hintText;
  final Icon? prefixIcon;
  const CustomTextfield({
    super.key,
    required this.label,
    required this.hintText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        labelText: label,
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
