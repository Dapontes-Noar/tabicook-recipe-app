import 'package:dio/dio.dart';
import 'package:tabi_cook/core/network/api_constants.dart';
import 'package:tabi_cook/core/network/exceptions/dio_client_exception.dart';
import 'package:tabi_cook/core/utils/constants/app_constants.dart';
import 'package:tabi_cook/features/recipes/data/models/categories_model.dart';
import 'package:tabi_cook/features/recipes/data/models/recipes_model.dart';

/// Abstract data source for fetching recipe data.
abstract class RecipesDataSource {
  Future<RecipesModel> getRecipesById(String id);

  Future<RecipesModel> getRecipesByName(String name);

  Future<RecipesModel> getRecipesByCategory(String category);

  Future<CategoriesModel> getCategories();
}

/// Implementation of [RecipesDataSource] that fetches recipe data from a remote API using Dio.
class RecipesDataSourceImpl implements RecipesDataSource {
  final Dio _dio;

  RecipesDataSourceImpl(this._dio);

  /// Fetches recipes by ID from the API.
  @override
  Future<RecipesModel> getRecipesById(String id) async {
    try {
      final response = await _dio.get(
        '/lookup.php',
        queryParameters: {'i': id},
      );
      if (response.statusCode == ApiConstants.statusOk) {
        return RecipesModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw DioClientException.unknown(response.statusCode);
      }
    } on DioException catch (e) {
      throw DioClientException.network(e.response?.statusCode);
    } catch (e) {
      throw Exception('${AppConstants.unexpectedError}: $e');
    }
  }

  /// Fetches recipes by name from the API.
  @override
  Future<RecipesModel> getRecipesByName(String name) async {
    try {
      final response = await _dio.get(
        '/search.php',
        queryParameters: {'s': name},
      );
      if (response.statusCode == ApiConstants.statusOk) {
        return RecipesModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw DioClientException.unknown(response.statusCode);
      }
    } on DioException catch (e) {
      throw DioClientException.network(e.response?.statusCode);
    } catch (e) {
      throw Exception('${AppConstants.unexpectedError}: $e');
    }
  }

  /// Fetches recipes by category from the API.
  @override
  Future<RecipesModel> getRecipesByCategory(String category) async {
    try {
      final response = await _dio.get(
        '/filter.php',
        queryParameters: {'c': category},
      );
      if (response.statusCode == ApiConstants.statusOk) {
        return RecipesModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw DioClientException.unknown(response.statusCode);
      }
    } on DioException catch (e) {
      throw DioClientException.network(e.response?.statusCode);
    } catch (e) {
      throw Exception('${AppConstants.unexpectedError}: $e');
    }
  }

  /// Fetches recipe categories from the API.
  @override
  Future<CategoriesModel> getCategories() async {
    try {
      final response = await _dio.get('/categories.php');
      if (response.statusCode == ApiConstants.statusOk) {
        return CategoriesModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw DioClientException.unknown(response.statusCode);
      }
    } on DioException catch (e) {
      throw DioClientException.network(e.response?.statusCode);
    } catch (e) {
      throw Exception('${AppConstants.unexpectedError}: $e');
    }
  }
}
