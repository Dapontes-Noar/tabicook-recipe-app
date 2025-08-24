import 'package:flutter_core_clean_mvvm/routes/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RouterModule {
  @lazySingleton
  GoRouter appRouter() => buildAppRouter();
}
