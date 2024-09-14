import 'package:{{title}}/core/common/models/user.model.dart';
import 'package:{{title}}/core/common/services/api.service.dart';
import 'package:{{title}}/core/common/services/token.service.dart';

class AuthRepository {
  APIService api;

  AuthRepository(this.api);

  Future<User> register(
    String name,
    String email,
    String password,
  ) async {
    final response = await api.dio.post(
      '/register',
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );
    return User.fromJson(response.data);
  }

  Future<User> login(
    String email,
    String password,
  ) async {
    final response = await api.dio.post(
      '/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    return User.fromJson(response.data);
  }

  Future<({String access, String refresh})> refresh() async {
    final response = await api.dio.get('/refresh');
    return (
      access: response.data['access_token'] as String,
      refresh: response.data['refresh_token'] as String,
    );
  }

  Future<void> logout() async {
    await TokenService.clear();
  }
}
