import 'package:tabi_cook/main.dart';
import 'package:go_router/go_router.dart';

GoRouter buildAppRouter() => GoRouter(
  initialLocation: '/home',
  routes: [
    // Define your routes here
    GoRoute(path: '/home', builder: (context, state) => MyHomePage()),
  ],
);
