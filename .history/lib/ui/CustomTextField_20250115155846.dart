import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;

  const CustomTextFieldWidget(
      {super.key, required this.hintText, required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 300,
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            labelText: hintText,
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
