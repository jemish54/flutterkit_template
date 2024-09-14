import 'package:get_it/get_it.dart';
import 'package:{{title}}/core/common/services/api.service.dart';
import 'package:{{title}}/features/auth/repositories/auth.repository.dart';

final getIt = GetIt.instance;

Future<void> initDeps() async {
  getIt.registerSingleton<APIService>(APIService());

  initAuth();
}

initAuth() {
  getIt.registerFactory(() => AuthRepository(getIt.get<APIService>()));
}
