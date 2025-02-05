import 'package:get/get.dart';

import 'package:testgetcli/app/modules/Home/bindings/home_binding.dart';
import 'package:testgetcli/app/modules/Home/views/home_view.dart';
import 'package:testgetcli/app/modules/Invoice/bindings/invoice_binding.dart';
import 'package:testgetcli/app/modules/Invoice/views/invoice_view.dart';
import 'package:testgetcli/app/modules/MyCart/bindings/my_cart_binding.dart';
import 'package:testgetcli/app/modules/MyCart/views/my_cart_view.dart';
import 'package:testgetcli/app/modules/Profile/bindings/profile_binding.dart';
import 'package:testgetcli/app/modules/Profile/views/profile_view.dart';
import 'package:testgetcli/app/modules/Register/bindings/register_binding.dart';
import 'package:testgetcli/app/modules/Register/views/register_view.dart';
import 'package:testgetcli/app/modules/favorite/bindings/favorite_binding.dart';
import 'package:testgetcli/app/modules/favorite/views/favorite_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.myCart,
      page: () => const MyCart(),
      binding: MyCartBinding(),
    ),
    GetPage(
      name: _Paths.invoice,
      page: () => const invoice(),
      binding: InvoiceBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
