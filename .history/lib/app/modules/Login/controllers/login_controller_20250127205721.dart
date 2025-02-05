import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/auth_service.dart';
import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService();
  final usernameController =
      TextEditingController(text: 'kminchelle'); // Default test username
  final passwordController =
      TextEditingController(text: '0lelplR'); // Default test password
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  Future<void> login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      errorMessage.value = 'Please fill in all fields';
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await _authService.login(
        usernameController.text,
        passwordController.text,
      );

      if (response != null) {
        Get.off(() => const HomeView()); // Navigate to home view on success
      } else {
        errorMessage.value = 'Invalid credentials';
      }
    } catch (e) {
      errorMessage.value = 'Invalid username or password';
      Get.snackbar(
        'Login Failed',
        'Please check your credentials and try again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
        colorText: Colors.red[900],
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
