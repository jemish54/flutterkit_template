import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'shared/providers/auth_status.provider.dart';
import 'features/auth/presentation/screens/login.screen.dart';
import 'features/auth/presentation/screens/signup.screen.dart';
import 'features/error/error.screen.dart';
import 'features/profile/presentation/screens/profile.screen.dart';
import 'features/splash/splash.screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(
  RouterRef ref,
) {
  final authState = ref.watch(authStatusProvider);
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: ProfileScreen.path,
    redirect: (context, state) {
      if (authState.isLoading) return SplashScreen.path;

      bool isAuthenticated = authState.requireValue != null;
      bool isAuthenticating = [
        LoginScreen.path,
        SignupScreen.path,
      ].contains(state.matchedLocation);

      return isAuthenticated
          ? isAuthenticating
              ? ProfileScreen.path
              : null
          : isAuthenticating
              ? null
              : LoginScreen.path;
    },
    routes: [
      SplashScreen.route(),
      LoginScreen.route(),
      SignupScreen.route(),
      ProfileScreen.route(),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      child: ErrorScreen(
        error: state.error?.message ?? 'Some Error Occured',
      ),
    ),
  );
}
