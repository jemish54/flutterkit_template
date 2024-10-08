import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class {{module_name_pascalCase}}Screen extends ConsumerWidget {
  const {{module_name_pascalCase}}Screen({super.key});

  static const String path = '/{{module_name_paramCase}}';
  static const String name = '{{module_name_titleCase}}';
  static route({List<RouteBase> routes = const []}) => GoRoute(
        path: path,
        name: name,
        pageBuilder: (context, state) => const MaterialPage(
          child: {{module_name_pascalCase}}Screen(),
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(name),
      ),
    );
  }
}
