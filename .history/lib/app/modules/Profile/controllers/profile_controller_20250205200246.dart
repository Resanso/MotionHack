import 'package:get/get.dart';
import 'package:testgetcli/services/storage_service.dart';
import 'package:testgetcli/services/api_service.dart';

class ProfileController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
  final ProductService _productService = ProductService();

  final RxString userName = 'Loading...'.obs;
  final RxString userEmail = 'Loading...'.obs;
  final RxInt totalProducts = 0.obs;
  final RxInt totalCategories = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfileData();
  }

  Future<void> loadProfileData() async {
    try {
      final products = await _productService.getProducts();
      if (products != null) {
        totalProducts.value = products.total ?? 0;

        // Get unique categories
        if (products.products != null) {
          final categories =
              products.products!.map((p) => p.category ?? '').toSet();
          totalCategories.value = categories.length;
        }
      }
    } catch (e) {
      print('Error loading profile data: $e');
    }
  }
}
