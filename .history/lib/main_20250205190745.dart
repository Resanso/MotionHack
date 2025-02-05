import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgetcli/app/controllers/navigation_controller.dart';
import 'package:testgetcli/app/modules/Home/bindings/home_binding.dart';
import 'package:testgetcli/app/modules/Login/views/login_view.dart';
import 'package:testgetcli/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:testgetcli/app/modules/home/views/home_view.dart';
import 'package:testgetcli/services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storageService = await StorageService.init();
  Get.put(storageService, permanent: true);
  Get.put(NavigationController(), permanent: true);
  Get.put(FavoriteController(), permanent: true);

  runApp(MyApp(storageService: storageService));
}

class MyApp extends StatelessWidget {
  final StorageService storageService;

  const MyApp({
    super.key,
    required this.storageService,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: storageService.isLoggedIn() ? const MainPage() : LoginPage(),
    );
  }
}

class MainPage extends GetView<NavigationController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.green[900],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: ''),
          ],
        ),
      ),
    );
  }
}
