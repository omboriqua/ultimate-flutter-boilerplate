// lib/src/core/services/alert_service.dart
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mvp_boilerplate/app/services/navigation_service.dart';

class AlertService {
  final GetIt _getIt = GetIt.instance;

  late NavigationService _navigationService;

  AlertService() {
    _navigationService = _getIt.get<NavigationService>();
  }
  void showToast({
    required BuildContext context,
    required String toastText,
    IconData toastIcon = Icons.info,
    Color iconColor = Colors.blue,
  }) {
    try {
      DelightToastBar(
        autoDismiss: true,
        position: DelightSnackbarPosition.top,
        builder: (context) {
          return ToastCard(
            leading: Icon(toastIcon, size: 28, color: iconColor),
            title: Text(
              toastText,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          );
        },
      ).show(context);
    } catch (e) {
      print(e);
    }
  }
}
