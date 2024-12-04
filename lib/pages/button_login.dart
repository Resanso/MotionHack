import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slicing_ui/pages/register_page.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // background color
            foregroundColor: Colors.white, // text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // rounded corners
            ),
            padding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10), // padding
          ),
          child: const Text('Login'),
        ),
      ),
    );
  }
}
