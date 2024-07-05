import 'package:get_storage/get_storage.dart';

class APIUtils {
  static final GetStorage _prefs = GetStorage('prefs');

  static Future<void> init() async {
    await GetStorage.init('prefs');
  }

  static String? getToken() {
    return _prefs.read('token');
  }

  static Future<void> setToken(String token) async {
    await _prefs.write('token', token);
  }

  static Future<void> clearToken() async {
    await _prefs.remove('token');
  }
}
