// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:slicing_ui/pages/button_login.dart';
import 'package:slicing_ui/widget/custom_text_field_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register !',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: GoogleFonts.plusJakartaSans().fontFamily),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Create your account for Happy Shopping',
                  style: TextStyle(
                      color: const Color(0x70707070),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.plusJakartaSans().fontFamily),
                ),
              ),
              const CustomTextFieldWidget(
                hintText: 'Full Name',
                prefixIcon: Icon(Icons.people_outline_rounded),
              ),
              const CustomTextFieldWidget(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              const CustomTextFieldWidget(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock_outlined),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: CustomTextFieldWidget(
                  hintText: 'Confirm Pasword',
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
              const ButtonLogin(
                buttonText: 'Register',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily:
                                    GoogleFonts.plusJakartaSans().fontFamily,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
