import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/storage_service.dart';
import '../../home/views/home_view.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService();
  late final StorageService _storageService;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    _storageService = await StorageService.init();
  }

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
        // Save login status and token
        await _storageService.saveToken(response.accessToken ?? '');
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

  Future<void> logout() async {
    await _storageService.clearToken();
    Get.offAllNamed('/login');
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
