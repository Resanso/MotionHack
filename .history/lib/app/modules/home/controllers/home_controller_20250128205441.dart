import 'package:get/get.dart';
import 'package:testgetcli/models/product_model_api.dart';
import 'package:testgetcli/services/api_service.dart';
import 'package:testgetcli/services/storage_service.dart';

class HomeController extends GetxController {
  final ProductService _productService = ProductService();
  final StorageService _storageService = Get.find<StorageService>();
  final RxList<ProductElement> products = <ProductElement>[].obs;
  final RxList<ProductElement> favoriteProducts = <ProductElement>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    loadFavorites();
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

  void loadFavorites() {
    final favorites = _storageService.getFavoriteProducts();
    if (favorites != null) {
      favoriteProducts.value = favorites;
    }
  }

  void toggleFavorite(ProductElement product) {
    if (isFavorite(product)) {
      favoriteProducts.remove(product);
    } else {
      favoriteProducts.add(product);
    }
    _storageService.saveFavoriteProducts(favoriteProducts);
  }

  bool isFavorite(ProductElement product) {
    return favoriteProducts.any((p) => p.id == product.id);
  }

  List<ProductElement> getFavoriteProducts() {
    return favoriteProducts;
  }
}
