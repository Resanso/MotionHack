import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/auth_service.dart';
import '../../home/views/home_view.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService();
  // Initialize with empty text controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  Future<void> login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      errorMessage.value = 'Please fill in all fields';
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
        colorText: Colors.red[900],
        duration: const Duration(seconds: 3),
      );
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
        Get.off(() => const HomeView());
      }
    } catch (e) {
      errorMessage.value = 'Invalid username or password';
      Get.snackbar(
        'Login Failed',
        errorMessage.value,
        snackPosition: SnackPosition.TOP,
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
