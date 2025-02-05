import 'package:get/get.dart';

import 'package:testgetcli/app/modules/Home/bindings/home_binding.dart';
import 'package:testgetcli/app/modules/Home/views/home_view.dart';
import 'package:testgetcli/app/modules/Invoice/bindings/invoice_binding.dart';
import 'package:testgetcli/app/modules/Invoice/views/invoice_view.dart';
import 'package:testgetcli/app/modules/MyCart/bindings/my_cart_binding.dart';
import 'package:testgetcli/app/modules/MyCart/views/my_cart_view.dart';
import 'package:testgetcli/app/modules/Register/bindings/register_binding.dart';
import 'package:testgetcli/app/modules/Register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MY_CART,
      page: () => MyCart(),
      binding: MyCartBinding(),
    ),
    GetPage(
      name: _Paths.INVOICE,
      page: () => invoice(),
      binding: InvoiceBinding(),
    ),
  ];
}
