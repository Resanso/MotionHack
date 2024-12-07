import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:slicing_ui/pages/button_login.dart';
import 'package:slicing_ui/pages/register_page.dart';
import 'package:slicing_ui/widget/custom_text_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
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
                      color: Colors.black,
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
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: CustomTextFieldWidget(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                const ButtonLogin(
                  buttonText: 'Login',
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Don`t have an account? ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.plusJakartaSans().fontFamily,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                text: 'Register',
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
          ),
        ),
      ),
    );
  }
}
