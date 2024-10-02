import 'package:{{title}}/core/common/models/user.model.dart';
import 'package:{{title}}/core/result/custom_exception.dart';
import 'package:test/core/common/services/api.service.dart';

class AuthRepository {
  APIService api;

  AuthRepository(this.api);

  Future<User?> getCurrentUser() async {}

  Future<bool> register(
    String name,
    String email,
    String password,
  ) async {}

  Future<User> verify(
    String email,
    String code,
  ) async {}

  Future<User> login(
    String email,
    String password,
  ) async {}

  Future<void> logout() async {}

  Future<({String access, String refresh})> refresh() async {}
}
