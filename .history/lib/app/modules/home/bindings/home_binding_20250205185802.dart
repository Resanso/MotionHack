import 'package:get/get.dart';
import 'package:testgetcli/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:testgetcli/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(FavoriteController());
  }
}
