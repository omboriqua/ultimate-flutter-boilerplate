// lib/src/auth/presentation/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get_it/get_it.dart';
import 'package:modular_ui/modular_ui.dart';
import 'package:mvp_boilerplate/app/providers/auth_provider.dart';
import 'package:mvp_boilerplate/app/services/navigation_service.dart';
import 'package:mvp_boilerplate/core/errors/alerts.dart';

class LoginScreen extends ConsumerStatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;
    await ref
        .read(authControllerProvider.notifier)
        .signIn(email, password, context);

    final isLoggedIn = ref.read(authStatusProvider);
    if (isLoggedIn) {
      GetIt.instance<AlertService>().showToast(
        context: context,
        toastText: 'Logged In Successfully',
        toastIcon: Icons.check_circle,
        iconColor: Colors.green,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigationService = GetIt.instance<NavigationService>();

    return Scaffold(
      body: Center(
        child: MUISignInCard(
          emailController: _emailController,
          passwordController: _passwordController,
          onRegisterNow: () {
            navigationService.navigateTo('/register');
          },
          onSignInPressed: () async {
            await _login(context);
            navigationService.navigateTo('/home');
          },
        ),
      ),
    );
  }
}
