import 'package:flutter/material.dart';
import 'package:testgetcli/app/modules/MyCart/controllers/my_cart_controller.dart';
import 'package:testgetcli/app/modules/MyCart/controllers/my_cart_controller.dart';

class ProductCard extends StatelessWidget {
  final String price;
  final String title;
  final String image;
  final CartController cartController;
  final Widget? actionButtons;

  const ProductCard({
    Key? key,
    required this.price,
    required this.title,
    required this.image,
    required this.cartController,
    this.actionButtons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
        padding: const EdgeInsets.all(10),
        width: 366,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: AssetImage(image),
                width: 92, // Adjust the width as needed
                height: 96, // Adjust the height as needed
                fit: BoxFit
                    .cover, // Ensure the image fits within the specified dimensions
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    price.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                    ),
                  ),
                  if (actionButtons != null) ...[
                    const SizedBox(height: 10),
                    actionButtons!,
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
