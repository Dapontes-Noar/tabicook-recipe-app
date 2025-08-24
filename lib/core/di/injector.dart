import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injector.config.dart';

final getIt = GetIt.instance;

/// Initializes the [GetIt] instance
@InjectableInit(initializerName: r"initGetIt")
Future<void> configureInjection({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
  await getIt.reset();
  getIt.initGetIt(
    environment: environment,
    environmentFilter: environmentFilter,
  );
}
