import 'package:get/get.dart';
import 'package:testgetcli/models/product_model_api.dart';
import 'package:testgetcli/services/api_service.dart';

class HomeController extends GetxController {
  final ProductService _productService = ProductService();
  final RxList<ProductElement> products = <ProductElement>[].obs;
  final RxList<ProductElement> favoriteProducts = <ProductElement>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      final fetchedProducts = await _productService.fetchProducts();
      if (fetchedProducts != null) {
        products.value = fetchedProducts;
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavorite(ProductElement product) {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
    } else {
      favoriteProducts.add(product);
    }
  }

  bool isFavorite(ProductElement product) {
    return favoriteProducts.contains(product);
  }

  List<ProductElement> getFavoriteProducts() {
    return favoriteProducts;
  }
}
