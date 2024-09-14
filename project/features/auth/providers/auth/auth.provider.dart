import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{title}}/core/common/models/user.model.dart';
import 'package:{{title}}/dependencies.dart';
import 'package:{{title}}/features/auth/repositories/auth.repository.dart';

part 'auth.provider.g.dart';

@riverpod
class Auth extends _$Auth {
  final service = getIt.get<AuthRepository>();

  @override
  FutureOr<User?> build() {
    return null;
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = AsyncData(await service.login(email, password));
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = AsyncData(await service.register(name, email, password));
  }

  Future<void> logout() async {
    await service.logout();
    state = const AsyncData(null);
  }
}
