import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{title.snakeCase()}}/dependencies.dart';
import 'package:{{title.snakeCase()}}/features/{{module_name.snakeCase()}}/repositories/{{module_name.snakeCase()}}.repository.dart';

part '../{{title.snakeCase()}}/{{module_name.snakeCase()}}.provider.g.dart';

@riverpod
class {{module_name.pascalCase()}} extends _${{module_name.pascalCase()}} {
  final service = getIt.get<{{module_name.pascalCase()}}Repository>();

  @override
  FutureOr<void> build() {
    return null;
  }
}
