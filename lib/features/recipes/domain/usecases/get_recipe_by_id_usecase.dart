import 'package:tabi_cook/core/utils/exceptions/recipes_exception.dart';
import 'package:tabi_cook/features/recipes/data/models/recipe_model.dart';
import 'package:tabi_cook/features/recipes/domain/repositories/recipes_repository.dart';

/// Use case for fetching a recipe by its ID from the repository.
class GetRecipeByIdUseCase {
  final RecipesRepository _repository;

  /// Creates a [GetRecipeByIdUseCase] with the given [RecipesRepository].
  GetRecipeByIdUseCase(this._repository);

  /// Fetches a recipe by its [id].
  Future<RecipeModel> call(String id) async {
    final response = await _repository.getRecipesById(id);
    if (response.meals != null && response.meals!.isNotEmpty) {
      return response.meals!.first;
    } else {
      throw RecipesException.noRecipesFound();
    }
  }
}
