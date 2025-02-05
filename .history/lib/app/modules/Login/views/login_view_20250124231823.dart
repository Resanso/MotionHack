import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:testgetcli/app/modules/Register/views/register_view.dart';
import 'package:testgetcli/ui/ButtonLogin.dart';
import 'package:testgetcli/ui/CustomTextField.dart';
import 'package:testgetcli/services/api_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getSingleProduct('login'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final product = snapshot.data as Map<String, dynamic>;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Builder(
            builder: (context) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(product['animation'], width: 200),
                    Text(
                      product['title'],
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
                        Get.to(RegisterPage());
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
      },
    );
  }
}
