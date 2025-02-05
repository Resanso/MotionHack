import 'package:get/get.dart';
import '../../../../models/user_model.dart';
import '../../../../services/user_service.dart';
import 'package:testgetcli/services/storage_service.dart';

class ProfileController extends GetxController {
  final UserService _userService = UserService();
  final StorageService _storageService = Get.find<StorageService>();
  final Rxn<User> user = Rxn<User>();
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      isLoading.value = true;
      final userData = await _userService.getUserProfile();
      user.value = userData;
    } catch (e) {
      print('Error fetching user profile: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
