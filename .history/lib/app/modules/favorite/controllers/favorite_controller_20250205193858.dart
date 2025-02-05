import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart'; // Use relative path
import 'package:testgetcli/models/product_model_api.dart';

class FavoriteController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();

  RxList<ProductElement> get favoriteProducts =>
      homeController.favoriteProducts;

  void removeFromFavorites(ProductElement product) {
    homeController.toggleFavorite(product);
  }
}
