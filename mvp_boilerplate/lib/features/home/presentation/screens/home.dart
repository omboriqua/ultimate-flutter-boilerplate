import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mvp_boilerplate/app/providers/auth_provider.dart';
import 'package:mvp_boilerplate/app/services/navigation_service.dart';
import 'package:mvp_boilerplate/core/errors/alerts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final userEmail = Supabase.instance.client.auth.currentUser?.email;

  Future<void> _logout(BuildContext context) async {
    await ref.read(authControllerProvider.notifier).signOut(context);

    final isLoggedIn = ref.read(authStatusProvider);
    if (isLoggedIn) {
      GetIt.instance<AlertService>().showToast(
        context: context,
        toastText: 'Logged Out Successfully',
        toastIcon: Icons.check_circle,
        iconColor: Colors.green,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigationService = GetIt.instance<NavigationService>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text('hello $userEmail'),
        ),
        GFButton(
          onPressed: () async {
            await _logout(context);
            navigationService.navigateTo('/');
          },
          size: GFSize.LARGE,
          icon: Icon(Icons.logout, color: Colors.white),
          shape: GFButtonShape.pills,
          child: Text('Logout', style: TextStyle(fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
