import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{title_snakeCase}}/dependencies.dart';
import 'package:{{title_snakeCase}}/features/{{module_name_snakeCase}}/repositories/{{module_name_snakeCase}}.repository.dart';

part '../{{title_snakeCase}}/{{module_name_snakeCase}}.provider.g.dart';

@riverpod
class {{module_name_pascalCase}} extends _${{module_name_pascalCase}} {
  final service = getIt.get<{{module_name_pascalCase}}Repository>();

  @override
  FutureOr<void> build() {
    return null;
  }
}
