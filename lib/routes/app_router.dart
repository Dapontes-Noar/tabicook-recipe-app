import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabi_cook/core/di/injector.dart';
import 'package:tabi_cook/features/home/presentation/bloc/home_bloc.dart';
import 'package:tabi_cook/features/home/presentation/bloc/home_event.dart';
import 'package:tabi_cook/features/home/presentation/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:tabi_cook/routes/routes.dart';

GoRouter buildAppRouter() => GoRouter(
  initialLocation: Routes.home,
  routes: [
    // Define your routes here
    GoRoute(
      path: Routes.home,
      name: 'home',
      builder: (context, state) {
        return BlocProvider<HomeBloc>(
          create: (_) => getIt<HomeBloc>()..add(const HomeRequested()),
          child: const HomeScreen(),
        );
      },
    ),
  ],
);
