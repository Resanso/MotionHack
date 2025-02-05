import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testgetcli/app/modules/Home/controllers/home_controller.dart';
import 'package:testgetcli/app/modules/MyCart/views/my_cart_view.dart';
import 'package:testgetcli/app/views/views/side_bar_view.dart';
import 'package:testgetcli/models/product_model_api.dart';
import 'package:testgetcli/services/api_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ProductService _productService = ProductService();
  late Future<List<ProductElement>?> _productsFuture;
  String _selectedCategory = 'all';
  final List<Map<String, String>> _categories = [
    {"slug": "all", "name": "All"},
    {"slug": "beauty", "name": "Beauty"},
    {"slug": "fragrances", "name": "Fragrances"},
    {"slug": "furniture", "name": "Furniture"},
    {"slug": "groceries", "name": "Groceries"},
    {"slug": "home-decoration", "name": "Home Decoration"},
    {"slug": "kitchen-accessories", "name": "Kitchen Accessories"},
    {"slug": "laptops", "name": "Laptops"},
    {"slug": "mens-shirts", "name": "Mens Shirts"},
    {"slug": "mens-shoes", "name": "Mens Shoes"},
    {"slug": "mens-watches", "name": "Mens Watches"},
    {"slug": "mobile-accessories", "name": "Mobile Accessories"},
    {"slug": "motorcycle", "name": "Motorcycle"},
    {"slug": "skin-care", "name": "Skin Care"},
    {"slug": "smartphones", "name": "Smartphones"},
    {"slug": "sports-accessories", "name": "Sports Accessories"},
    {"slug": "sunglasses", "name": "Sunglasses"},
    {"slug": "tablets", "name": "Tablets"},
    {"slug": "tops", "name": "Tops"},
    {"slug": "vehicle", "name": "Vehicle"},
    {"slug": "womens-bags", "name": "Womens Bags"},
    {"slug": "womens-dresses", "name": "Womens Dresses"},
    {"slug": "womens-jewellery", "name": "Womens Jewellery"},
    {"slug": "womens-shoes", "name": "Womens Shoes"},
    {"slug": "womens-watches", "name": "Womens Watches"},
  ];

  @override
  void initState() {
    super.initState();
    _productsFuture = _productService.fetchProducts();
  }

  void _fetchProductsByCategory(String category) {
    setState(() {
      _selectedCategory = category;
      if (category == 'all') {
        _productsFuture = _productService.fetchProducts();
      } else {
        _productsFuture = _productService.getProductsByCategory(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset('assets/ham.png', width: 20, height: 20),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/shop.png', width: 47, height: 47)],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {
              Get.to(MyCart());
            },
          ),
        ],
      ),
      drawer: SideBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Our way of loving\nyou back',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Container(
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: _categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      _fetchProductsByCategory(category['slug']!);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 8),
                      decoration: BoxDecoration(
                        color: _selectedCategory == category['slug']
                            ? Colors.green
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(category['name']!),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Our Best Seller',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<ProductElement>?>(
              future: _productsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No products available'));
                } else {
                  final products = snapshot.data!;
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        product: product,
                        image: product.thumbnail ?? '',
                        name: product.title ?? '',
                        price: product.price ?? 0.0,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  final ProductElement product;
  final HomeController homeController = Get.find<HomeController>();

  ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              image: image,
              name: name,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Center(
                  child: Image.network(image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Obx(() {
                        final isFavorite = homeController.isFavorite(product);
                        return IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                          ),
                          color: isFavorite ? Colors.red : Colors.grey,
                          onPressed: () {
                            homeController.toggleFavorite(product);
                          },
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String image;
  final String name;
  final double price;

  const ProductDetailScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Product',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Center(
                child: Image.network(image),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.',
                  style: TextStyle(
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(MyCart());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Add to bag',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
