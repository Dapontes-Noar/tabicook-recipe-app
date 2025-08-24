# flutter-core-clean-mvvm

A flutter core with Clean architecture, MVVM design pattern with Bloc, Get_it, Dio, Hive and intl

## Getting Started

This project is a starting point for a Flutter application

## Starting the project

1. Clone the repository
   ```bash
   git clone
    ```
2. Navigate to the project directory
   ```bash
   cd flutter_core_clean_mvvm
   ```
3. Install dependencies
   ```bash
   flutter pub get
   ```
4. For code generation (models, localization, etc.), run:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
5. Generate localization files
   ```bash
   flutter pub run intl_utils:generate
   ```
6. Run the app
   ```bash
    flutter run -t lib/main_dev.dart
    ```
Can you use this command for installation, code generation and localization in one step:

```bash
  flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
```

To document the use of a general registration class named `RegisterModule` for dependency injection, add a section to
your `README.md` like this:

---

# Developer Guide

## Architecture Overview

This project follows the Clean Architecture principles combined with the MVVM design pattern. The architecture is
divided into several layers:

- **Core Layer**: Contains shared utilities, dependency injection setup, and network configurations.
- **Feature Layer**: Each feature is self-contained with its own data, domain, and presentation layers.
- **Shared Layer**: Contains reusable UI components, themes, and types used across multiple features.
- **Routes Layer**: Manages navigation and routing within the application.
- **Styles Layer**: Defines the app-wide theming and styles.
- **App Entry Points**: Separate entry points for different build configurations (e.g., development, production).
- **Dependency Injection**: Utilizes `get_it` and `injectable` for managing dependencies through a centralized
  `RegisterModule`.
- **Networking**: Uses `Dio` for HTTP requests, with custom interceptors and exception handling.
- **State Management**: Implements the MVVM pattern using `Bloc` for state management.
- **Local Storage**: Uses `Hive` for local data persistence.
- **Localization**: Supports multiple languages using the `intl` package.
- **Code Generation**: Leverages `build_runner` for generating boilerplate code, models, and localization files.
- **Testing**: Includes unit and widget tests to ensure code quality and reliability.
- **Continuous Integration**: Configured with CI/CD pipelines for automated testing and deployment.
- **Documentation**: Comprehensive documentation is provided to assist developers in understanding and contributing to
  the project.

## Packages structure

This project is structured in a way that follows the Clean Architecture principles. The main packages are:

```
lib/
├─ app.dart                   # App-level configuration and setup
├─ main_dev.dart              # Main entry for development builds
├─ core/                      # Shared utilities, dependency injection, network, constants
│  ├─ di/                     # Dependency injection setup (e.g., Get_it)
│  ├─ network/                # Network clients, API configuration (e.g., Dio)
|  |   ├─ exceptions/         # Custom exceptions for network errors
│  │   └─ interceptors/       # Dio interceptors for logging, auth, etc.
│  ├─ utils/                  # Common utility functions and helpers
|      └─extensions/          # Dart extensions
├─ [features]/                # Modular feature folders (specific for each feature) 
│   ├─ data/                  # Data layer
│   │  ├─ datasources/        # Remote/local data sources
│   │  ├─ models/             # Data models (+ generated files)
│   |  └─ repositories/       # Data repository implementations
│   ├─ domain/                # Domain layer
│   │  ├─ entities/           # Business entities
│   │  ├─ repositories/       # Repository interfaces
│   │  └─ usecases/           # Use case classes
│   └─ presentation/          # Presentation layer
│      ├─ pages/              # UI pages/screens
│      ├─ viewmodels/         # MVVM view models
│      └─ widgets/            # Feature-specific widgets
├─ shared/                    # Shared UI widgets, theme, types
├─ styles/                    # App-wide theming and styles
└─ routes/                    # Centralized app routing
```

Here’s a detailed section for your `README.md` describing the package structure and utility, tailored to your repo:

---

### Utility

- **app.dart / main_dev.dart**: Application entry points and configuration.
- **core/**: Houses shared logic for dependency injection, networking, and utilities used across features.
- **features/**: Each feature (meals, favorites, shopping) is self-contained, following Clean Architecture:
    - **data/**: Handles data access, models, and repository implementations.
    - **domain/**: Contains business entities, repository interfaces, and use cases.
    - **presentation/**: Manages UI, view models, and widgets for each feature.
- **shared/**: Provides reusable UI components, theming, and type definitions.
- **routes/**: Centralizes route definitions for navigation.

This structure supports modularity, scalability, and maintainability, following Clean Architecture and MVVM principles
for Flutter development.

## Dependency Injection with RegisterModule

This project uses a general module class, `RegisterModule`, to register dependencies via `get_it` and `injectable`.

**Example Implementation:**

Create `lib/core/di/register_module.dart`:

```dart
// dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() => Dio();

// Add other dependencies here
}
```

Set up injection in `lib/core/di/injection.dart`:

```dart
// dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
```

Initialize dependencies in your main entry file:

```dart
// dart
void main() async {
  await configureDependencies();
  runApp(MyApp());
}
```

Run code generation:

```bash
  flutter pub run build_runner build --delete-conflicting-outputs
```

---
This setup enables automatic registration and injection of dependencies using the `RegisterModule` class.

## Routes

This project uses a centralized routing system. All routes are defined in `lib/routes/app_router.dart`. You can add new
routes by updating this file.

In this project we use `go_router` package for routing., here is an example of how to define routes:

```dart
GoRouter buildAppRouter() =>
    GoRouter(
      initialLocation: '/home',
      routes: [
        // Define your routes here
        GoRoute(path: '/home', builder: (context, state) => MyHomePage()),
      ],
    );
```

## Intl Localization

This project uses the `intl` package for localization. To add a new language, follow these steps:

1. Add the new language ARB file in `lib/l10n/` (e.g., `intl_es.arb` for Spanish).
2. Run the following command to generate localization files:
   ```bash
   flutter pub get
   ```
3. Update the `supportedLocales` in `app.dart` to include the new language.
4. Use the generated localization classes in your widgets, in this project we use `context.l10n.your_key`.