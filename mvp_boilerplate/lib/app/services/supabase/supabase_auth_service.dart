// lib/src/auth/services/supabase_auth_service.dart

import 'package:postgrest/postgrest.dart' as postgrest;
import 'package:gotrue/gotrue.dart' as gotrue;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  final SupabaseClient _client;

  SupabaseAuthService(this._client);

  Future<void> signIn(String email, String password) async {
    try {
      final AuthResponse response = await _client.auth
          .signInWithPassword(email: email, password: password);
    } catch (e) {
      if (e is postgrest.PostgrestException) {
        throw CustomAuthException(e.message);
      } else if (e is gotrue.AuthException) {
        throw CustomAuthException(e.message);
      } else {
        throw CustomAuthException("An unknown error occurred.");
      }
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      final AuthResponse response =
          await _client.auth.signUp(email: email, password: password);
    } catch (e) {
      if (e is postgrest.PostgrestException) {
        throw CustomAuthException(e.message);
      } else if (e is gotrue.AuthException) {
        throw CustomAuthException(e.message);
      } else {
        throw CustomAuthException("An unknown error occurred.");
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } catch (e) {
      throw CustomAuthException("An error occurred while signing out.");
    }
  }

  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;
}

class CustomAuthException implements Exception {
  final String message;
  CustomAuthException(this.message);
}
