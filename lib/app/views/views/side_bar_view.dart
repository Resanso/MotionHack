import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/storage_service.dart';
import '../../modules/Login/views/login_view.dart';

class SideBar extends StatelessWidget {
  SideBar({super.key});

  final StorageService _storageService = Get.find<StorageService>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[900],
              ),
              accountName: const Text('Resan So'),
              accountEmail: const Text('resan@blabalba.blablabal'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('My Cart'),
              onTap: () {
                Get.back();
                // ...existing cart navigation code...
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await _storageService.clearToken(); // Clear the login status
                Get.offAll(() => LoginPage()); // Navigate to login page
              },
            ),
          ],
        ),
      ),
    );
  }
}
