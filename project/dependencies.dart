import 'package:get_it/get_it.dart';

import 'features/auth/repositories/auth.repository.dart';

final getIt = GetIt.instance;

Future<void> initDeps() async {
  // Register Singleton Services Here

  initAuth();
}

initAuth() {
  getIt.registerFactory(() => AuthRepository());
}
