import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:slicing_ui/pages/button_login.dart';
import 'package:slicing_ui/widget/custom_text_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/login.json', width: 200),
              Text(
                'Welcome !',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontFamily: GoogleFonts.plusJakartaSans().fontFamily),
              ),
              Text(
                'Happy Shopping All',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.plusJakartaSans().fontFamily),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const CustomTextFieldWidget(),
              const ButtonLogin(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don`t have an account?',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontFamily: GoogleFonts.plusJakartaSans().fontFamily),
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
