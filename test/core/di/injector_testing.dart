import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../mocks.dart';

final GetIt injectorTester = GetIt.instance;

void initTesterInjection() {
  injectorTester.registerLazySingleton<Dio>(() => mockDio);
}
