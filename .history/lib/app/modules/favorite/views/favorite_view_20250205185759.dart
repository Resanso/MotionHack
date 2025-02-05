import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgetcli/app/modules/favorite/controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  FavoriteView({Key? key}) : super(key: key);

  final favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.favoriteProducts.isEmpty) {
          return const Center(
            child: Text('No favorite products yet'),
          );
        }

        return ListView.builder(
          itemCount: controller.favoriteProducts.length,
          itemBuilder: (context, index) {
            final product = controller.favoriteProducts[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: product.thumbnail != null
                    ? Image.network(
                        product.thumbnail!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.image),
                title: Text(product.title ?? 'No title'),
                subtitle: Text(
                  '\$${product.price?.toString() ?? 'N/A'}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () => controller.toggleFavorite(product),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
