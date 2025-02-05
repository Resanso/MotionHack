import 'package:dio/dio.dart';
import '../models/user_model.dart';

class UserService {
  final Dio _dio = Dio();

  Future<User?> getUserProfile() async {
    try {
      final response = await _dio.get('https://dummyjson.com/users/1');
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to load user profile: $e');
    }
  }
}
