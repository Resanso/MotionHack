import 'package:get/get.dart';
import 'package:testgetcli/app/modules/home/controllers/home_controller.dart'; // Update this import
import 'package:testgetcli/models/product_model_api.dart';

class FavoriteController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();

  RxList<ProductElement> get favoriteProducts =>
      homeController.favoriteProducts;

  void removeFromFavorites(ProductElement product) {
    homeController.toggleFavorite(product);
  }
}
