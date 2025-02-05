import 'package:dio/dio.dart';
import '../app/shared/constanta.dart';
import '../models/login_model.dart';

class AuthService {
  Future<LoginResponse?> login(String username, String password) async {
    try {
      final response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }
}
