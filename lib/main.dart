import 'package:flutter/material.dart';
import 'package:tabi_cook/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:tabi_cook/shared/widgets/my_custom_scroll_behavior.dart';
import 'package:tabi_cook/styles/app_styles.dart';
import 'core/di/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(MyApp(router: getIt<GoRouter>()));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(colorScheme: $appStyles.colors.toColorScheme()),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}
