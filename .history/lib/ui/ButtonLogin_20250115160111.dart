import 'package:flutter/material.dart';
import 'package:testgetcli/app/modules/Home/views/home_view.dart';

class ButtonLogin extends StatelessWidget {
  final String buttonText;

  const ButtonLogin({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeView(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00623B), // background color
            foregroundColor: Colors.white, // text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // rounded corners
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 10), // padding
          ),
          child: Text(buttonText),
        ),
      ),
    );
  }
}
