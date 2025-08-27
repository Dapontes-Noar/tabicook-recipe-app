import 'package:injectable/injectable.dart';
import 'package:tabi_cook/core/di/injector.dart';
import 'package:tabi_cook/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:tabi_cook/features/recipes/domain/usecases/get_categories_usecase.dart';
import 'package:tabi_cook/features/recipes/domain/usecases/get_recipes_by_category_usecase.dart';

@module
abstract class UseCasesModule {
  /// Register your use cases here abstract class UseCasesModule {
  @factoryMethod
  GetCategoriesUseCase getCategories() =>
      GetCategoriesUseCase(getIt<RecipesRepository>());

  @factoryMethod
  GetRecipesByCategoryUseCase getRecipesByCategory() =>
      GetRecipesByCategoryUseCase(getIt<RecipesRepository>());
}
