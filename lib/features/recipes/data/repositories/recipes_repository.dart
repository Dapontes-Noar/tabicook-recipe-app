import 'package:tabi_cook/core/network/exceptions/dio_client_exception.dart';
import 'package:tabi_cook/core/utils/exceptions/recipes_exception.dart';
import 'package:tabi_cook/features/recipes/data/datasources%20/recipes_datasource.dart';
import 'package:tabi_cook/features/recipes/data/models/categories_model.dart';

/// Abstract repository for fetching recipe data.
/// /// Implementations should provide data retrieval logic from a data source.
abstract class RecipesRepository {
  Future<CategoriesModel> getCategories();
}

/// Implementation of [RecipesRepository] that fetches recipe request from a data source.
class RecipesRepositoryImpl implements RecipesRepository {
  final RecipesDataSource _dataSource;

  /// Creates a [RecipesRepositoryImpl] with the given [RecipesDataSource].
  RecipesRepositoryImpl(this._dataSource);

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
