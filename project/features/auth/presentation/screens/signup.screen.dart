import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/extensions/context.extension.dart';
import '../../../../core/utils/helpers/snackbar.helper.dart';
import '../../../../core/utils/helpers/space.helper.dart';
import '../../../../core/utils/validators.dart';
import '../../providers/auth/auth.provider.dart';
import 'login.screen.dart';

class SignupScreen extends HookConsumerWidget {
  const SignupScreen({super.key});

  static const String path = '/signup';
  static const String name = 'Signup';
  static route({List<RouteBase> routes = const []}) => GoRoute(
        path: path,
        name: name,
        pageBuilder: (context, state) => const MaterialPage(
          child: SignupScreen(),
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());

    final isVerifying = useState(false);

    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final verificationController = useTextEditingController();

    ref.listen(
      authProvider,
      (previous, next) {
        next.whenOrNull(
          error: (error) => context.showError(error),
        );
      },
    );

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const FlutterLogo(size: 100),
                  Space.y(32),
                  Text(
                    isVerifying.value ? 'Verify Email' : 'Sign up',
                    style: context.textStyles.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  Space.y(32),
                  isVerifying.value
                      ? Column(
                          children: [
                            Text(
                              emailController.text,
                              style: context.textStyles.bodyLarge,
                            ),
                            Space.y(16),
                            TextFormField(
                              controller: verificationController,
                              decoration: const InputDecoration(
                                labelText: 'Verification Code',
                                prefixIcon: Icon(Icons.verified),
                              ),
                              validator: (Validator()..required()).call,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                labelText: 'Name',
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: (Validator()..required()).call,
                            ),
                            Space.y(16),
                            TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email),
                              ),
                              validator: Validators.email.call,
                            ),
                            Space.y(16),
                            HookBuilder(builder: (context) {
                              final isObscured = useState(true);
                              return TextFormField(
                                controller: passwordController,
                                obscureText: isObscured.value,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    onPressed: () =>
                                        isObscured.value = !isObscured.value,
                                    icon: Icon(
                                      isObscured.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                ),
                                validator: Validators.password.call,
                              );
                            }),
                          ],
                        ),
                  Space.y(24),
                  ref.watch(authProvider).maybeWhen(
                        orElse: () => ElevatedButton(
                          onPressed: () async {
                            if (!formKey.value.currentState!.validate()) return;
                            if (isVerifying.value) {
                              await ref.read(authProvider.notifier).verify(
                                    email: emailController.text,
                                    code: verificationController.text,
                                  );
                            } else {
                              await ref.read(authProvider.notifier).register(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                              isVerifying.value = true;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.colors.primaryContainer,
                            foregroundColor: context.colors.onPrimaryContainer,
                          ),
                          child: Text(
                            isVerifying.value ? 'Verify' : 'Sign up',
                            style: context.textStyles.bodyLarge,
                          ),
                        ),
                        loading: () => ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.colors.primaryContainer,
                            foregroundColor: context.colors.onPrimaryContainer,
                          ),
                          child: const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                  Space.y(32),
                  GestureDetector(
                    onTap: () => context.goNamed(LoginScreen.name),
                    child: const Text(
                      'Already have an account? Login',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Space.y(48),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
