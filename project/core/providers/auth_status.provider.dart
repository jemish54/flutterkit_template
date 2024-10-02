import 'package:{{title}}/dependencies.dart';
import 'package:{{title}}/features/auth/repositories/auth.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../common/models/user.model.dart';

part 'auth_status.provider.g.dart';

@riverpod
class AuthStatus extends _$AuthStatus {
  final repository = getIt.get<AuthRepository>();

  @override
  FutureOr<User?> build() {
    return repository.getCurrentUser();
  }
}
