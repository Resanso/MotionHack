import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/auth_service.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService();
  final usernameController =
      TextEditingController(text: 'emilys'); // Default test username
  final passwordController =
      TextEditingController(text: 'emilyspass'); // Default test password
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
        // Store token if needed
        // Get.find<StorageService>().saveToken(response.accessToken);
        Get.offAllNamed('/home');
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Login Failed',
        errorMessage.value,
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
