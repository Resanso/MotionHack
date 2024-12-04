import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 300,
        child: TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
