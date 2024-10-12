import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/providers/auth_status.provider.dart';
import '../../../../shared/services/http/result/custom_exception.dart';
import '../../../../dependencies.dart';
import '../../repositories/auth.repository.dart';
import 'auth.state.dart';

part 'auth.provider.g.dart';

@riverpod
class Auth extends _$Auth {
  final repository = getIt.get<AuthRepository>();

  @override
  AuthState build() {
    return const AuthState.initial();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();
    try {
      await repository.login(email, password);

      ref.invalidate(authStatusProvider);
      await ref.read(authStatusProvider.future);
    } on CustomException catch (e) {
      state = AuthState.error(error: e.message);
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();
    await repository.register(name, email, password);
    state = const AuthState.verifying();
  }

  Future<void> verify({
    required String email,
    required String code,
  }) async {
    state = const AuthState.loading();
    await repository.verify(email, code);
    ref.invalidate(authStatusProvider);
    await ref.read(authStatusProvider.future);
    state = const AuthState.success();
  }

  Future<void> logout() async {
    await repository.logout();
    ref.invalidate(authStatusProvider);
    state = const AuthState.initial();
  }
}
