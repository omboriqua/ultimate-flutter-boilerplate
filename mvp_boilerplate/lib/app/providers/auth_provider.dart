// lib/src/auth/providers/auth_provider.dart
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:mvp_boilerplate/app/services/supabase/supabase_auth_service.dart';
import 'package:mvp_boilerplate/core/errors/alerts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseClientProvider = Provider((ref) => Supabase.instance.client);

final authServiceProvider = Provider<SupabaseAuthService>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseAuthService(client);
});

final authStateProvider = StreamProvider((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.authStateChanges;
});

final authStatusProvider = StateProvider<bool>((ref) {
  final session = Supabase.instance.client.auth.currentSession;
  return session != null;
});

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthController(authService, ref);
});

class AuthController extends StateNotifier<bool> {
  final SupabaseAuthService _authService;
  final Ref _ref;
  final AlertService _alertService = GetIt.instance<AlertService>();

  AuthController(this._authService, this._ref) : super(false) {
    _authService.authStateChanges.listen((event) {
      _ref.read(authStatusProvider.notifier).state =
          event != AuthChangeEvent.signedOut;
    });
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      await _authService.signIn(email, password);
      state = true;
      _alertService.showToast(
        context: context,
        toastText: "Login successful!",
        toastIcon: Icons.check_circle,
        iconColor: Colors.green,
      );
    } catch (e) {
      state = false;
      if (e is CustomAuthException) {
        _alertService.showToast(
          context: context,
          toastText: e.message,
          toastIcon: Icons.error,
          iconColor: Colors.red,
        );
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _authService.signOut();
      state = false;
      _alertService.showToast(
        context: context,
        toastText: "Logout successful!",
        toastIcon: Icons.check_circle,
        iconColor: Colors.green,
      );
    } catch (e) {
      if (e is CustomAuthException) {
        _alertService.showToast(
          context: context,
          toastText: e.message,
          toastIcon: Icons.error,
          iconColor: Colors.red,
        );
      }
    }
  }

  Future<void> register(
      String email, String password, BuildContext context) async {
    try {
      await _authService.signUp(email, password);
      _alertService.showToast(
        context: context,
        toastText:
            "Registration successful! Please check your email to verify your account.",
        toastIcon: Icons.check_circle,
        iconColor: Colors.green,
      );
    } catch (e) {
      if (e is CustomAuthException) {
        _alertService.showToast(
          context: context,
          toastText: e.message,
          toastIcon: Icons.error,
          iconColor: Colors.red,
        );
      }
    }
  }
}
