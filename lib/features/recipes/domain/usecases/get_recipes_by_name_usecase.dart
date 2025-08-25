import 'package:tabi_cook/core/utils/exceptions/recipes_exception.dart';
import 'package:tabi_cook/features/recipes/data/models/recipes_model.dart';
import 'package:tabi_cook/features/recipes/domain/repositories/recipes_repository.dart';

/// Use case for fetching recipes by name from the repository.
class GetRecipesByNameUseCase {
  final RecipesRepository repository;

  /// Creates a [GetRecipesByNameUseCase] with the given [RecipesRepository].
  GetRecipesByNameUseCase(this.repository);

  /// Fetches recipes by the given [name].
  Future<RecipesModel> call(String name) async {
    final response = await repository.getRecipesByName(name);
    if (response.meals != null && response.meals!.isNotEmpty) {
      return response;
    } else {
      throw RecipesException.noRecipesByName(name);
    }
  }
}
