// lib/src/core/services/navigation_service.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvp_boilerplate/features/auth/presentation/screens/login.dart';
import 'package:mvp_boilerplate/features/auth/presentation/screens/register.dart';
import 'package:mvp_boilerplate/features/home/presentation/screens/home.dart';

class NavigationService {
  //late GlobalKey<NavigatorState> _navigatorKey;
  late GoRouter _router;

  NavigationService() {
    // _navigatorKey = GlobalKey<NavigatorState>();
    _router = GoRouter(
      routes: [
        GoRoute(
          name: 'login',
          path: '/',
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          name: 'register',
          path: '/register',
          builder: (context, state) => RegisterScreen(),
        ),
        GoRoute(
          name: 'home',
          path: '/home',
          builder: (context, state) => HomeScreen(),
        )
        // Add other routes here
      ],
    );
  }

  // GlobalKey<NavigatorState>? get navigatorKey {
  //   return _navigatorKey;
  // }

  GoRouter get router => _router;

  void navigateTo(String routeName, {Object? arguments}) {
    _router.go(routeName, extra: arguments);
  }

  bool goBack() {
    if (_router.routerDelegate.canPop()) {
      _router.routerDelegate.pop();
      return true;
    }
    return false;
  }
}
