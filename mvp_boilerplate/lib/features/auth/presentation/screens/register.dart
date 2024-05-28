// lib/src/auth/presentation/screens/register_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modular_ui/modular_ui.dart';

import 'package:get_it/get_it.dart';
import 'package:mvp_boilerplate/app/providers/auth_provider.dart';
import 'package:mvp_boilerplate/app/services/navigation_service.dart';
import 'package:mvp_boilerplate/core/errors/alerts.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _register(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;
    await ref
        .read(authControllerProvider.notifier)
        .register(email, password, context);

    GetIt.instance<AlertService>().showToast(
      context: context,
      toastText:
          'Registration successful! Please check your email to verify your account.',
      toastIcon: Icons.check_circle,
      iconColor: Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    final navigationService = GetIt.instance<NavigationService>();
    return Scaffold(
      body: Center(
        child: MUISignUpCard(
          emailController: _emailController,
          passwordController: _passwordController,
          confirmPasswordController: _confirmPasswordController,
          onSignUpPressed: () async {
            await _register(context);
            navigationService.navigateTo('/');
          },
          onLogInNowPressed: () {
            navigationService.navigateTo('/');
          },
        ),
      ),
    );
  }
}
