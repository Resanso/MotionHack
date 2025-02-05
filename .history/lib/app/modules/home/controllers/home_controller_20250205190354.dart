import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
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

  void toggleFavorite(ProductElement product) {
    final index = favoriteProducts.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      favoriteProducts.removeAt(index);
    } else {
      favoriteProducts.add(product);
    }
    saveFavorites();
  }

  bool isFavorite(ProductElement product) {
    return favoriteProducts.any((p) => p.id == product.id);
  }

  Future<void> saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String encodedData = json.encode(
        favoriteProducts.map((product) => product.toJson()).toList(),
      );
      await prefs.setString('favorite_products', encodedData);
    } catch (e) {
      print('Error saving favorites: $e');
    }
  }

  Future<void> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? jsonString = prefs.getString('favorite_products');
      if (jsonString != null) {
        final List<dynamic> jsonList = json.decode(jsonString);
        favoriteProducts.value =
            jsonList.map((json) => ProductElement.fromJson(json)).toList();
      }
    } catch (e) {
      print('Error loading favorites: $e');
    }
  }
}
