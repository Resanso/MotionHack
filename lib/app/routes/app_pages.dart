import 'package:get/get.dart';

import 'package:testgetcli/app/modules/HomeScreen/bindings/home_screen_binding.dart';
import 'package:testgetcli/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:testgetcli/app/modules/Invoice/bindings/invoice_binding.dart';
import 'package:testgetcli/app/modules/Invoice/views/invoice_view.dart';
import 'package:testgetcli/app/modules/LoginPage/bindings/login_page_binding.dart';
import 'package:testgetcli/app/modules/LoginPage/views/login_page_view.dart';
import 'package:testgetcli/app/modules/MyCart/bindings/my_cart_binding.dart';
import 'package:testgetcli/app/modules/MyCart/views/my_cart_view.dart';
import 'package:testgetcli/app/modules/RegisterPage/bindings/register_page_binding.dart';
import 'package:testgetcli/app/modules/RegisterPage/views/register_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_PAGE,
      page: () => RegisterPageView(),
      binding: RegisterPageBinding(),
    ),
    GetPage(
      name: _Paths.MY_CART,
      page: () => MyCartView(),
      binding: MyCartBinding(),
    ),
    GetPage(
      name: _Paths.INVOICE,
      page: () => InvoiceView(),
      binding: InvoiceBinding(),
    ),
  ];
}
