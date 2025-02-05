import 'package:dio/dio.dart';
import '../models/login_model.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<LoginResponse?> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'https://dummyjson.com/auth/login',
        data: {
          'username': username, // kminchelle
          'password': password, // 0lelplR
        },
      );

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('Invalid credentials');
      }
      throw Exception('Login failed: ${e.message}');
    }
  }
}
