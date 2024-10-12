import '../../../shared/models/user.model.dart';
import 'auth.protocol.dart';

class AuthRepository implements AuthProtocol {
  @override
  Future<User?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<({String access, String refresh})> refresh() {
    // TODO: implement refresh
    throw UnimplementedError();
  }

  @override
  Future<bool> register(String name, String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<User> verify(String email, String code) {
    // TODO: implement verify
    throw UnimplementedError();
  }
}
