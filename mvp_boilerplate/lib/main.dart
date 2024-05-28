// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'package:mvp_boilerplate/app/services/navigation_service.dart';
import 'package:mvp_boilerplate/app/theme/theme.dart';
import 'package:mvp_boilerplate/core/utils/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://yoururl.com',
    anonKey: 'your key',
  );

  setupLocator();
  final navigationService = GetIt.instance<NavigationService>();

  if (Supabase.instance.client.auth.currentUser != null) {
    navigationService.navigateTo('/home');
  } else {
    navigationService.navigateTo('/');
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationService = locator<NavigationService>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: navigationService.router,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      //key: navigationService.navigatorKey,
    );
  }
}
