
# Flutter Boilerplate with Supabase, Riverpod, and GoRouter

This Flutter boilerplate project is designed to provide a robust starting point for building Flutter applications. It integrates Supabase for backend services, Riverpod for state management, and GoRouter for navigation. The project follows clean architecture principles to ensure maintainability and scalability.

## Table of Contents
1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Packages Used](#packages-used)
4. [Setup Instructions](#setup-instructions)
5. [Folder Structure](#folder-structure)
6. [Features](#features)
7. [Why These Packages?](#why-these-packages)
8. [Contributing](#contributing)
9. [License](#license)

## Overview
This boilerplate is set up with the following core packages:
- **Supabase**: For backend services, authentication, and database.
- **Riverpod**: For state management.
- **GoRouter**: For navigation.
- **GetIt**: For dependency injection.
- **FlexColorScheme**: For theming.

## Architecture
This project follows the feature-first modular architecture and the principles of Clean Architecture. The core layers are:
1. **Presentation**: Contains UI code and widgets.
2. **Domain**: Contains business logic and entities.
3. **Data**: Contains data sources, repositories, and models.

### Folder Structure
```
lib/
|-- app/
|   |-- router/
|   |   |-- routes.dart
|   |-- theme/
|       |-- theme.dart
|-- src/
|   |-- auth/
|   |   |-- data/
|   |   |   |-- models/
|   |   |   |-- repositories/
|   |   |-- domain/
|   |   |   |-- entities/
|   |   |-- presentation/
|   |       |-- screens/
|   |-- core/
|   |   |-- services/
|   |   |   |-- navigation_service.dart
|   |   |   |-- alert_service.dart
|   |-- home/
|       |-- presentation/
|           |-- screens/
|-- main.dart
|-- service_locator.dart
```

## Main Packages Used
- **[Supabase](https://pub.dev/packages/supabase_flutter)**: Backend services, authentication, and database.
- **[Riverpod](https://pub.dev/packages/flutter_riverpod)**: State management.
- **[GoRouter](https://pub.dev/packages/go_router)**: Navigation.
- **[GetIt](https://pub.dev/packages/get_it)**: Dependency injection.
- **[FlexColorScheme](https://pub.dev/packages/flex_color_scheme)**: Theming.
- **[DelightfulToast](https://pub.dev/packages/delightful_toast)**: Toast notifications.
- **[Flutter SVG](https://pub.dev/packages/flutter_svg)**: SVG rendering.

  ### Full List Of Packages Used

  #### Dependencies

  ``` bash
  
  cached_network_image: ^3.3.1
  connectivity_plus: ^6.0.3
  cupertino_icons: ^1.0.8
  delightful_toast: ^1.1.0
  device_info_plus: ^10.1.0
  dio: ^5.4.3+1
  equatable: ^2.0.5
  fl_country_code_picker: ^0.1.9+1
  flex_color_scheme: ^7.3.1
  flutter:
    sdk: flutter
  flutter_animate: ^4.5.0
  flutter_keyboard_visibility: ^6.0.0
  flutter_riverpod: ^2.5.1
  flutter_slidable: ^3.1.0
  flutter_speed_dial: ^7.0.0
  flutter_spinkit: ^5.2.1
  flutter_stripe: ^10.1.1
  flutter_svg: ^2.0.10+1
  fpdart: ^1.1.0
  freezed_annotation: ^2.4.1
  geocoding: ^3.0.0
  geolocator: ^12.0.0
  get_it: ^7.7.0
  getwidget: ^4.0.0
  giphy_get: ^3.5.5
  go_router: ^14.1.3
  google_fonts: ^6.2.1
  google_nav_bar: ^5.0.6
  image_picker: ^1.1.1
  introduction_screen: ^3.1.14
  json_annotation: ^4.9.0
  location: ^6.0.2
  lottie: ^3.1.2
  marquee: ^2.2.3
  modular_ui: ^0.0.5
  package_info_plus: ^8.0.0
  path: ^1.9.0
  path_provider: ^2.1.3
  permission_handler: ^11.3.1
  pin_code_fields: ^8.0.1
  retrofit: ^4.1.0
  segmented_button_slide: ^1.0.4
  share_plus: ^9.0.0
  shorebird_code_push: ^1.1.3
  supabase_flutter: ^2.5.3
  url_launcher: ^6.2.6
  video_player: ^2.8.6
  ```
#### Dev Dependencies

```bash
dev_dependencies:
  build_runner: ^2.4.10
  custom_lint: ^0.6.4
  flutter_lints: ^4.0.0
  flutter_test:
    sdk: flutter
  riverpod_generator: ^2.4.0
  riverpod_lint: ^2.3.10
```

## Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/omboriqua/ultimate-flutter-boilerplate.git
   cd ultimate-flutter-boilerplate
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Supabase**
   - Open `main.dart` and add your Supabase URL and anon key.
   ```dart
   void main() {
     final container = ProviderContainer();
     Supabase.initialize(
       url: 'your-supabase-url',
       anonKey: 'your-supabase-anon-key',
     );
     setupLocator(container);
     runApp(ProviderScope(
       container: container,
       child: MyApp(),
     ));
   }
   ```

4. **Run the App**
   ```bash
   flutter run
   ```

## Features
- **Authentication**: Sign in, sign out, and register using Supabase.
- **State Management**: Manage state using Riverpod.
- **Navigation**: Navigate using GoRouter.
- **Theming**: Customize themes using FlexColorScheme.
- **Dependency Injection**: Manage dependencies using GetIt.
- **Toast Notifications**: Show toast notifications using DelightfulToast.

## Why These Packages?

### Supabase
Supabase is chosen for its simplicity and robustness in handling backend services, including authentication, real-time databases, and file storage. It provides an excellent alternative to Firebase with an open-source approach.

### Riverpod
Riverpod is a modern state management solution for Flutter that provides a robust and scalable way to manage state. It solves many issues found in other state management solutions like Provider, making it ideal for large applications.

### GoRouter
GoRouter is a declarative router for Flutter applications, which simplifies navigation and handles deep linking and redirection efficiently.

### GetIt
GetIt is a simple service locator for Dart and Flutter that allows easy dependency injection. It helps in managing dependencies and improving the testability of the code.

### FlexColorScheme
FlexColorScheme is used for theming due to its flexibility and ease of use. It allows for comprehensive theme customization and ensures a consistent look and feel across the app.

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request for review.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

```

This README.md provides a detailed overview of the project, its architecture, the packages used, and instructions for setting up the project. It also explains why specific packages were chosen and how they contribute to the project's goals.
