import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tabi_cook/core/network/exceptions/dio_client_exception.dart';
import 'package:tabi_cook/features/recipes/data/datasources/recipes_datasource.dart';
import 'package:tabi_cook/features/recipes/data/models/categories_model.dart';
import 'package:tabi_cook/features/recipes/data/models/recipes_model.dart';

import 'recipes_datasource_test.mocks.dart' show MockDio;


@GenerateMocks([Dio])
void main() {
  late RecipesDataSourceImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = RecipesDataSourceImpl(mockDio);
  });

  group('RecipesDataSourceImpl', () {
    const id = '123';
    const name = 'Pasta';
    const category = 'Dessert';
    final recipesJson = {'meals': []};
    final categoriesJson = {'categories': []};

    test('getRecipesById returns RecipesModel on success', () async {
      when(mockDio.get('/lookup.php', queryParameters: {'i': id}))
          .thenAnswer((_) async => Response(
        data: recipesJson,
        statusCode: 200,
        requestOptions: RequestOptions(path: '/lookup.php'),
      ));

      final result = await dataSource.getRecipesById(id);

      expect(result, isA<RecipesModel>());
      verify(mockDio.get('/lookup.php', queryParameters: {'i': id})).called(1);
    });

    test('getRecipesByName returns RecipesModel on success', () async {
      when(mockDio.get('/search.php', queryParameters: {'s': name}))
          .thenAnswer((_) async => Response(
        data: recipesJson,
        statusCode: 200,
        requestOptions: RequestOptions(path: '/search.php'),
      ));

      final result = await dataSource.getRecipesByName(name);

      expect(result, isA<RecipesModel>());
      verify(mockDio.get('/search.php', queryParameters: {'s': name})).called(1);
    });

    test('getRecipesByCategory returns RecipesModel on success', () async {
      when(mockDio.get('/filter.php', queryParameters: {'c': category}))
          .thenAnswer((_) async => Response(
        data: recipesJson,
        statusCode: 200,
        requestOptions: RequestOptions(path: '/filter.php'),
      ));

      final result = await dataSource.getRecipesByCategory(category);

      expect(result, isA<RecipesModel>());
      verify(mockDio.get('/filter.php', queryParameters: {'c': category})).called(1);
    });

    test('getCategories returns CategoriesModel on success', () async {
      when(mockDio.get('/categories.php'))
          .thenAnswer((_) async => Response(
        data: categoriesJson,
        statusCode: 200,
        requestOptions: RequestOptions(path: '/categories.php'),
      ));

      final result = await dataSource.getCategories();

      expect(result, isA<CategoriesModel>());
      verify(mockDio.get('/categories.php')).called(1);
    });

    test('throws DioClientException on DioException', () async {
      when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
          .thenThrow(DioException(
        requestOptions: RequestOptions(path: '/'),
      ));

      expect(() => dataSource.getRecipesById(id),
          throwsA(isA<DioClientException>()));
    });
  });
}