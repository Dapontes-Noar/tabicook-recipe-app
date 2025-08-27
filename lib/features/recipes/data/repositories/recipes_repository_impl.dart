import 'package:tabi_cook/core/network/exceptions/dio_client_exception.dart';
import 'package:tabi_cook/core/utils/exceptions/recipes_exception.dart';
import 'package:tabi_cook/features/recipes/data/datasources/recipes_datasource.dart';
import 'package:tabi_cook/features/recipes/data/models/categories_model.dart';
import 'package:tabi_cook/features/recipes/data/models/recipes_model.dart';
import 'package:tabi_cook/features/recipes/domain/repositories/recipes_repository.dart';

/// Implementation of [RecipesRepository] that fetches recipe request from a data source.
class RecipesRepositoryImpl implements RecipesRepository {
  final RecipesDataSource _dataSource;

  /// Creates a [RecipesRepositoryImpl] with the given [RecipesDataSource].
  RecipesRepositoryImpl(this._dataSource);

  /// Fetches recipes by ID from the data source.
  @override
  Future<RecipesModel> getRecipesById(String id) async {
    try {
      final recipesResponse = await _dataSource.getRecipesById(id);
      if (recipesResponse.meals != null && recipesResponse.meals!.isNotEmpty) {
        return recipesResponse;
      } else {
        throw RecipesException.noRecipesFound();
      }
    } on DioClientException catch (e) {
      throw RecipesException.networkError(e.message);
    } catch (e) {
      throw RecipesException.fetchFailed(e.toString());
    }
  }

  /// Fetches recipes by name from the data source.
  @override
  Future<RecipesModel> getRecipesByName(String name) async {
    try {
      final recipesResponse = await _dataSource.getRecipesByName(name);
      if (recipesResponse.meals != null && recipesResponse.meals!.isNotEmpty) {
        return recipesResponse;
      } else {
        throw RecipesException.noRecipesFound();
      }
    } on DioClientException catch (e) {
      throw RecipesException.networkError(e.message);
    } catch (e) {
      throw RecipesException.fetchFailed(e.toString());
    }
  }

  /// Fetches recipes by category from the data source.
  @override
  Future<RecipesModel> getRecipesByCategory(String category) async {
    try {
      final recipesResponse = await _dataSource.getRecipesByCategory(category);
      if (recipesResponse.meals != null && recipesResponse.meals!.isNotEmpty) {
        return recipesResponse;
      } else {
        throw RecipesException.noRecipesFound();
      }
    } on DioClientException catch (e) {
      throw RecipesException.networkError(e.message);
    } catch (e) {
      throw RecipesException.fetchFailed(e.toString());
    }
  }

  /// Fetches recipe categories from the data source.
  @override
  Future<CategoriesModel> getCategories() async {
    try {
      final categoriesResponse = await _dataSource.getCategories();
      if (categoriesResponse.categories != null &&
          categoriesResponse.categories!.isNotEmpty) {
        return categoriesResponse;
      } else {
        throw RecipesException.noCategoriesFound;
      }
    } on DioClientException catch (e) {
      throw RecipesException.networkError(e.message);
    } catch (e) {
      throw RecipesException.fetchFailed(e.toString());
    }
  }
}
