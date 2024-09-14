import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  static const String _accessToken = 'access-token';
  static const String _refreshToken = 'refresh-token';

  static const _storage = FlutterSecureStorage();

  static Future<void> save({
    required String access,
    required String refresh,
  }) async {
    await _storage.write(key: _accessToken, value: access);
    await _storage.write(key: _refreshToken, value: refresh);
  }

  static Future<void> clear() async {
    await _storage.deleteAll();
  }

  static Future<String?> get accessToken async =>
      await _storage.read(key: _accessToken);
  static Future<String?> get refreshToken async =>
      await _storage.read(key: _refreshToken);
}
