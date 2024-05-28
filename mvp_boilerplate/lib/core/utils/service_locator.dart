// lib/service_locator.dart
import 'package:get_it/get_it.dart';
import 'package:mvp_boilerplate/app/services/navigation_service.dart';
import 'package:mvp_boilerplate/core/errors/alerts.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AlertService());
  locator.registerLazySingleton(() => NavigationService());
}
