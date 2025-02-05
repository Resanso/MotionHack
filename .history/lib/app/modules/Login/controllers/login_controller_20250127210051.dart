import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/auth_service.dart';
import '../../home/views/home_view.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService();
  // Set default values for testing
  final usernameController =
      TextEditingController(text: 'emilys'); // updated username
  final passwordController =
      TextEditingController(text: 'emily.johnson'); // updated password
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
        'Please check your credentials and try again\nUsername: emilys\nPassword: emily.johnson',
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
