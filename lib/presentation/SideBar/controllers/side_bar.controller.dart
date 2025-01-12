import 'package:get/get.dart';

class SideBarController extends GetxController {
  //TODO: Implement SideBarController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
