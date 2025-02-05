import 'package:dio/dio.dart';
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://api.example.com';
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  static Future<List<dynamic>> getAllProductsByCategory(String category) async {
    try {
      final response =
          await _dio.get('/products', queryParameters: {'category': category});
      return response.data as List<dynamic>;
    } on DioError catch (e) {
      throw Exception('Failed to load products: ${e.message}');
    }
  }

  static Future<List<dynamic>> getCategoryList() async {
    try {
      final response = await _dio.get('/categories');
      return response.data as List<dynamic>;
    } on DioError catch (e) {
      throw Exception('Failed to load categories: ${e.message}');
    }
  }

  static Future<Map<String, dynamic>> getSingleProduct(String id) async {
    try {
      final response = await _dio.get('/products/$id');
      return response.data as Map<String, dynamic>;
    } on DioError catch (e) {
      throw Exception('Failed to load product: ${e.message}');
    }
  }
}
