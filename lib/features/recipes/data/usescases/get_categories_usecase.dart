import 'package:tabi_cook/core/utils/exceptions/recipes_exception.dart';
import 'package:tabi_cook/features/recipes/data/models/categories_model.dart';
import 'package:tabi_cook/features/recipes/data/repositories/recipes_repository.dart';

/// Use case for fetching recipe categories from the repository.
class GetCategoriesUseCase {
  final RecipesRepository _repository;

  /// Creates a [GetCategoriesUseCase] with the given [RecipesRepository].
  GetCategoriesUseCase(this._repository);

  /// Fetches recipe categories.
  /// Throws [RecipesRepositoryException] if no categories are found.
  Future<CategoriesModel> call() async {
    final response = await _repository.getCategories();
    if (response.categories != null && response.categories!.isNotEmpty) {
      return response;
    } else {
      throw RecipesException.noCategoriesFound();
    }
  }
}
