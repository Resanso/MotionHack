import 'package:get/get.dart';
import 'package:testgetcli/app/modules/home/controllers/home_controller.dart';

import '../controllers/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<FavoriteController>(
      () => FavoriteController(),
    );
  }
}
