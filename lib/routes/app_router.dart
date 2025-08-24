import 'package:flutter_core_clean_mvvm/main.dart';
import 'package:go_router/go_router.dart';

GoRouter buildAppRouter() => GoRouter(
  initialLocation: '/home',
  routes: [
    // Define your routes here
    GoRoute(path: '/home', builder: (context, state) => MyHomePage()),
  ],
);
