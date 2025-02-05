import 'package:get/get.dart';
import 'package:testgetcli/services/api_service.dart';

class HomeController extends GetxController {
  var categories = [].obs;
  var products = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      var categoryList = await ApiService.getCategoryList();
      categories.assignAll(categoryList);
    } finally {
      isLoading(false);
    }
  }

  void fetchProductsByCategory(String category) async {
    try {
      isLoading(true);
      var productList = await ApiService.getAllProductsByCategory(category);
      products.assignAll(productList);
    } finally {
      isLoading(false);
    }
  }
}
