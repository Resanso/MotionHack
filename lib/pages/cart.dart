import 'package:flutter/material.dart';
import 'package:slicing_ui/controller/cart_controller.dart';
// ignore: unused_import
import 'package:slicing_ui/pages/home_page.dart';
import 'package:slicing_ui/pages/invoice.dart';
import 'package:slicing_ui/widget/card.dart' as card;
import 'package:get/get.dart';

class myCart extends StatelessWidget {
  const myCart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final anotherController = Get.put(AnotherController());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          title: const Text('My Cart'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              card.ProductCard(
                price: '50.00',
                title: 'Mi Band 8 Pro - New',
                image: 'assets/jam.png',
                cartController: cartController,
                actionButtons: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        cartController.quantityDecrement();
                      },
                    ),
                    Obx(() => Text('${cartController.quantity}')),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        cartController.quantityIncrement();
                      },
                    ),
                  ],
                ),
              ),
              card.ProductCard(
                price: '50.00',
                title: 'Mi Band 8 Pro - New',
                image: 'assets/shirt.png',
                cartController: cartController,
                actionButtons: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        anotherController.decrement();
                      },
                    ),
                    Obx(() => Text('${anotherController.quantity}')),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        anotherController.increment();
                      },
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(invoice());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
