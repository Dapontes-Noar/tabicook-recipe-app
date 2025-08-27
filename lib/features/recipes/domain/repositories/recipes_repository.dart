import 'package:tabi_cook/features/recipes/data/models/categories_model.dart';
import 'package:tabi_cook/features/recipes/data/models/recipes_model.dart';

/// Abstract repository for fetching recipe data.
abstract class RecipesRepository {
  Future<RecipesModel> getRecipesById(String id);

  Future<RecipesModel> getRecipesByName(String name);

  Future<RecipesModel> getRecipesByCategory(String category);

  Future<CategoriesModel> getCategories();
}
