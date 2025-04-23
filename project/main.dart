import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app.dart';
import 'core/utils/platform_type.dart';
import 'dependencies.dart';

Future<void> main() async {
  // await dotenv.load(fileName: Assets.config.assets.env.aEnvStaging);

  WidgetsFlutterBinding.ensureInitialized();

  await initDeps();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final platformType = detectPlatformType();

  runApp(
    ProviderScope(
      overrides: [
        platformTypeProvider.overrideWithValue(platformType),
      ],
      child: const App(),
    ),
  );
}
