import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tabi_cook/core/di/injector.dart';
import 'package:tabi_cook/features/recipes/data/datasources/recipes_datasource.dart';

///Data source module for dependency injection.
@module
abstract class DataSourceModule {
  // Register your data sources here
  @lazySingleton
  RecipesDataSource recipesDataSource() => RecipesDataSourceImpl(getIt<Dio>());

}
