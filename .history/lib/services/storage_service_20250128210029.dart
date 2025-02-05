import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String TOKEN_KEY = 'auth_token';
  static const String LOGIN_STATUS = 'is_logged_in';

  final SharedPreferences _prefs;

  StorageService(this._prefs);

  static Future<StorageService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
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
}
