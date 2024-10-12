import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'router.dart';
import 'theme/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final theme = ref.watch(themeProvider);

    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: theme.make(Colors.blue),
      darkTheme: theme.make(Colors.blue, Brightness.dark),
      routerConfig: router,
    );
  }
}
