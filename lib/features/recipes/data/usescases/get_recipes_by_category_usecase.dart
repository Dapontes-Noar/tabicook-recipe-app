import 'package:tabi_cook/core/utils/exceptions/recipes_exception.dart';
import 'package:tabi_cook/features/recipes/data/models/recipes_model.dart';
import 'package:tabi_cook/features/recipes/data/repositories/recipes_repository.dart';

class GetRecipesByCategoryUseCase {
  final RecipesRepository _repository;

  GetRecipesByCategoryUseCase(this._repository);

  Future<RecipesModel> call(String category) async {
    final response = await _repository.getRecipesByCategory(category);
    if (response.meals != null && response.meals!.isNotEmpty) {
      return response;
    } else {
      throw RecipesException.noRecipesFound();
    }
  }
}
