import '../app/shared/constanta.dart';
import '../models/user_model.dart';

class UserService {
  Future<User?> getUserProfile() async {
    try {
      final response = await dio.get('https://dummyjson.com/users/1');
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
