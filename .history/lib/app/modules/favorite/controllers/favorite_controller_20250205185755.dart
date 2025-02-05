import 'package:get/get.dart';
import 'package:testgetcli/app/modules/home/controllers/home_controller.dart';
import 'package:testgetcli/models/product_model_api.dart';

class FavoriteController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();

  RxList<ProductElement> get favoriteProducts =>
      homeController.favoriteProducts;

  void toggleFavorite(ProductElement product) {
    homeController.toggleFavorite(product);
  }

  bool isFavorite(ProductElement product) {
    return homeController.isFavorite(product);
  }
}
