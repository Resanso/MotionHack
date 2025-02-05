import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testgetcli/models/product_model_api.dart';

class StorageService {
  static const String TOKEN_KEY = 'auth_token';
  static const String LOGIN_STATUS = 'is_logged_in';
  static const String FAVORITES_KEY = 'favorites';

  late SharedPreferences _prefs;

  StorageService(this._prefs);

  static Future<StorageService> init() async {
    final instance = StorageService(await SharedPreferences.getInstance());
    return instance;
  }

  Future<void> saveToken(String token) async {
    await _prefs.setString(TOKEN_KEY, token);
    await _prefs.setBool(LOGIN_STATUS, true);
  }

  Future<void> clearToken() async {
    await _prefs.remove(TOKEN_KEY);
    await _prefs.setBool(LOGIN_STATUS, false);
  }

  bool isLoggedIn() {
    return _prefs.getBool(LOGIN_STATUS) ?? false;
  }

  String? getToken() {
    return _prefs.getString(TOKEN_KEY);
  }

  Future<void> saveFavoriteProducts(List<ProductElement> products) async {
    final String encodedData = json.encode(
      products.map((product) => product.toJson()).toList(),
    );
    await _prefs.setString(FAVORITES_KEY, encodedData);
  }

  List<ProductElement> getFavoriteProducts() {
    final String? jsonString = _prefs.getString(FAVORITES_KEY);
    if (jsonString == null) return [];

    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList
        .map((json) => ProductElement.fromJson(json))
        .toList();
  }
}
