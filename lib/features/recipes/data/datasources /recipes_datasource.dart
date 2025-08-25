import 'package:dio/dio.dart';
import 'package:tabi_cook/core/network/api_constants.dart';
import 'package:tabi_cook/core/network/exceptions/dio_client_exception.dart';
import 'package:tabi_cook/features/recipes/data/models/categories_model.dart';

/// Abstract data source for fetching recipe data.
abstract class RecipesDataSource {
  Future<CategoriesModel> getCategories();

}

/// Implementation of [RecipesDataSource] that fetches recipe data from a remote API using Dio.
class RecipesDataSourceImpl implements RecipesDataSource {
  final Dio _dio;

  RecipesDataSourceImpl(this._dio);

  /// Fetches recipe categories from the API.
  @override
  Future<CategoriesModel> getCategories() async {
    try {
      final response = await _dio.get('/categories.php');
      if (response.statusCode == ApiConstants.statusOk) {
        return CategoriesModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw DioClientException(
          response.statusMessage ?? 'Unknown error',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw DioClientException(
        e.message ?? 'Network error',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
