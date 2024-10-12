import '../../../shared/models/user.model.dart';

abstract interface class AuthProtocol {
  Future<User?> getCurrentUser();

  Future<bool> register(
    String name,
    String email,
    String password,
  );

  Future<User> verify(
    String email,
    String code,
  );

  Future<User> login(
    String email,
    String password,
  );

  Future<void> logout();

  Future<({String access, String refresh})> refresh();
}
