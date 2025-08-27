import 'package:injectable/injectable.dart';
import 'package:tabi_cook/core/di/injector.dart';
import 'package:tabi_cook/features/recipes/data/datasources/recipes_datasource.dart';
import 'package:tabi_cook/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:tabi_cook/features/recipes/domain/repositories/recipes_repository.dart';

/// Repository module for dependency injection.
@module
abstract class RepositoryModule {
  // Register your repositories here
  @lazySingleton
  RecipesRepository recipesRepository() =>
      RecipesRepositoryImpl(getIt<RecipesDataSource>());
}
