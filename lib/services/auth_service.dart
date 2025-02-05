import 'package:dio/dio.dart';
import '../models/login_model.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<LoginResponse?> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'https://dummyjson.com/auth/login',
        options: Options(
          headers: {'Content-Type': 'application/json'},
          followRedirects: false,
        ),
        data: {
          'username': username,
          'password': password,
          'expiresInMins': 30,
        },
      );

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('Invalid username or password');
      }
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }
}
