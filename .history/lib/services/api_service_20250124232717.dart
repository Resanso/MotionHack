import 'package:dio/dio.dart';
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: Duration(seconds: 10), // Increased timeout
    receiveTimeout: Duration(seconds: 10), // Increased timeout
  ));

  static Future<List<dynamic>> getProductList() async {
    try {
      final response =
          await _dio.get('/posts'); // Using /posts endpoint as a dummy
      return response.data as List<dynamic>;
    } on DioError catch (e) {
      throw Exception('Failed to load products: ${e.message}');
    }
  }

  static Future<List<dynamic>> getCategoryList() async {
    try {
      final response =
          await _dio.get('/users'); // Using /users endpoint as a dummy
      return response.data as List<dynamic>;
    } on DioError catch (e) {
      throw Exception('Failed to load categories: ${e.message}');
    }
  }

  static Future<List<dynamic>> getAllProductsByCategory(String category) async {
    try {
      final response = await _dio.get('/posts', queryParameters: {
        'userId': category
      }); // Using /posts with userId as a dummy
      return response.data as List<dynamic>;
    } on DioError catch (e) {
      throw Exception('Failed to load products by category: ${e.message}');
    }
  }

  static Future<Map<String, dynamic>> getSingleProduct(String id) async {
    try {
      final response =
          await _dio.get('/posts/$id'); // Using /posts/{id} endpoint as a dummy
      return response.data as Map<String, dynamic>;
    } on DioError catch (e) {
      throw Exception('Failed to load product: ${e.message}');
    }
  }
}
