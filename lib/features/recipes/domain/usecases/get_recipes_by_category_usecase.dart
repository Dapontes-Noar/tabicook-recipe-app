import 'package:tabi_cook/core/utils/exceptions/recipes_exception.dart';
import 'package:tabi_cook/features/recipes/domain/entities/recipe.dart';
import 'package:tabi_cook/features/recipes/domain/repositories/recipes_repository.dart';

/// Use case for fetching recipes by category from the repository.
class GetRecipesByCategoryUseCase {
  final RecipesRepository _repository;

  /// Creates a [GetRecipesByCategoryUseCase] with the given [RecipesRepository].
  GetRecipesByCategoryUseCase(this._repository);

  /// Fetches recipes by the given [category].
  Future<List<Recipe>> call(String category) async {
    final response = await _repository.getRecipesByCategory(category);
    if (response.meals != null && response.meals!.isNotEmpty) {
      return response.toEntityList();
    } else {
      throw RecipesException.noRecipesFound();
    }
  }
}
