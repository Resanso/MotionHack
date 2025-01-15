import 'package:get/get.dart';

import '../../../../presentation/SideBar/controllers/side_bar.controller.dart';

class SideBarControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SideBarController>(
      () => SideBarController(),
    );
  }
}
