import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:testgetcli/app/modules/Register/views/register_view.dart';
import 'package:testgetcli/ui/ButtonLogin.dart';
import '../controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/login.json', width: 200),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                ),
              ),
              Text(
                'Happy Shopping All',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: loginController.usernameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
                child: TextField(
                  controller: loginController.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Obx(() => loginController.isLoading.value
                  ? const CircularProgressIndicator()
                  : ButtonLogin(
                      buttonText: 'Login',
                      onPressed: () => loginController.login(),
                    )),
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
    );
  }
}
