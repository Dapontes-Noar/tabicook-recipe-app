import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tabi_cook/core/network/exceptions/dio_client_exception.dart';
import 'package:tabi_cook/core/utils/exceptions/recipes_exception.dart';
import 'package:tabi_cook/features/recipes/data/datasources/recipes_datasource.dart';
import 'package:tabi_cook/features/recipes/data/models/categories_model.dart';
import 'package:tabi_cook/features/recipes/data/models/recipes_model.dart';
import 'package:tabi_cook/features/recipes/data/models/recipe_model.dart';
import 'package:tabi_cook/features/recipes/data/models/category_model.dart';
import 'package:tabi_cook/features/recipes/data/repositories/recipes_repository_impl.dart';

import 'recipes_repository_impl_test.mocks.dart';

@GenerateMocks([RecipesDataSource])
void main() {
  late RecipesRepositoryImpl repository;
  late MockRecipesDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockRecipesDataSource();
    repository = RecipesRepositoryImpl(mockDataSource);
  });

  group('getRecipesById', () {
    const id = '123';
    final recipesModel = RecipesModel(
      meals: [
        RecipeModel(
          idMeal: '123',
          strMeal: 'Pasta',
          strCategory: 'Main Course',
          strArea: 'Italian',
          strInstructions: 'Cook pasta. Add sauce.',
          strMealThumb: 'http://example.com/pasta.jpg',
        ),
      ],
    );

    test('returns RecipesModel on success', () async {
      when(
        mockDataSource.getRecipesById(id),
      ).thenAnswer((_) async => recipesModel);

      final result = await repository.getRecipesById(id);

      expect(result, recipesModel);
      verify(mockDataSource.getRecipesById(id)).called(1);
    });

    test('throws RecipesException.noRecipesFound when no meals', () async {
      when(
        mockDataSource.getRecipesById(id),
      ).thenAnswer((_) async => RecipesModel(meals: null));

      expect(
        () => repository.getRecipesById(id),
        throwsA(isA<RecipesException>()),
      );
    });

    test(
      'throws RecipesException.networkError on DioClientException',
      () async {
        when(
          mockDataSource.getRecipesById(id),
        ).thenThrow(DioClientException('Network error'));

        expect(
          () => repository.getRecipesById(id),
          throwsA(isA<RecipesException>()),
        );
      },
    );

    test('throws RecipesException.fetchFailed on unknown exception', () async {
      when(mockDataSource.getRecipesById(id)).thenThrow(Exception('Unknown'));

      expect(
        () => repository.getRecipesById(id),
        throwsA(isA<RecipesException>()),
      );
    });
  });

  group('getRecipesByName', () {
    const name = 'Pasta';
    final recipesModel = RecipesModel(
      meals: [
        RecipeModel(
          idMeal: '123',
          strMeal: 'Pasta',
          strCategory: 'Main Course',
          strArea: 'Italian',
          strInstructions: 'Cook pasta. Add sauce.',
          strMealThumb: 'http://example.com/pasta.jpg',
        ),
      ],
    );

    test('returns RecipesModel on success', () async {
      when(
        mockDataSource.getRecipesByName(name),
      ).thenAnswer((_) async => recipesModel);

      final result = await repository.getRecipesByName(name);

      expect(result, recipesModel);
      verify(mockDataSource.getRecipesByName(name)).called(1);
    });

    test('throws RecipesException.noRecipesFound when no meals', () async {
      when(
        mockDataSource.getRecipesByName(name),
      ).thenAnswer((_) async => RecipesModel(meals: null));

      expect(
        () => repository.getRecipesByName(name),
        throwsA(isA<RecipesException>()),
      );
    });

    test(
      'throws RecipesException.networkError on DioClientException',
      () async {
        when(
          mockDataSource.getRecipesByName(name),
        ).thenThrow(DioClientException('Network error'));

        expect(
          () => repository.getRecipesByName(name),
          throwsA(isA<RecipesException>()),
        );
      },
    );

    test('throws RecipesException.fetchFailed on unknown exception', () async {
      when(
        mockDataSource.getRecipesByName(name),
      ).thenThrow(Exception('Unknown'));

      expect(
        () => repository.getRecipesByName(name),
        throwsA(isA<RecipesException>()),
      );
    });
  });

  group('getRecipesByCategory', () {
    const category = 'Dessert';
    final recipesModel = RecipesModel(
      meals: [
        RecipeModel(
          idMeal: '456',
          strMeal: 'Cake',
          strCategory: 'Dessert',
          strArea: 'French',
          strInstructions: 'Bake the cake.',
          strMealThumb: 'http://example.com/cake.jpg',
        ),
      ],
    );

    test('returns RecipesModel on success', () async {
      when(
        mockDataSource.getRecipesByCategory(category),
      ).thenAnswer((_) async => recipesModel);

      final result = await repository.getRecipesByCategory(category);

      expect(result, recipesModel);
      verify(mockDataSource.getRecipesByCategory(category)).called(1);
    });

    test('throws RecipesException.noRecipesFound when no meals', () async {
      when(
        mockDataSource.getRecipesByCategory(category),
      ).thenAnswer((_) async => RecipesModel(meals: null));

      expect(
        () => repository.getRecipesByCategory(category),
        throwsA(isA<RecipesException>()),
      );
    });

    test(
      'throws RecipesException.networkError on DioClientException',
      () async {
        when(
          mockDataSource.getRecipesByCategory(category),
        ).thenThrow(DioClientException('Network error'));

        expect(
          () => repository.getRecipesByCategory(category),
          throwsA(isA<RecipesException>()),
        );
      },
    );

    test('throws RecipesException.fetchFailed on unknown exception', () async {
      when(
        mockDataSource.getRecipesByCategory(category),
      ).thenThrow(Exception('Unknown'));

      expect(
        () => repository.getRecipesByCategory(category),
        throwsA(isA<RecipesException>()),
      );
    });
  });

  group('getCategories', () {
    final categoriesModel = CategoriesModel(
      categories: [
        CategoryModel(
          idCategory: '1',
          strCategory: 'Dessert',
          strCategoryThumb: 'http://example.com/dessert.jpg',
          strCategoryDescription: 'Sweet treats',
        ),
      ],
    );

    test('returns CategoriesModel on success', () async {
      when(
        mockDataSource.getCategories(),
      ).thenAnswer((_) async => categoriesModel);

      final result = await repository.getCategories();

      expect(result, categoriesModel);
      verify(mockDataSource.getCategories()).called(1);
    });

    test(
      'throws RecipesException.noCategoriesFound when no categories',
      () async {
        when(
          mockDataSource.getCategories(),
        ).thenAnswer((_) async => CategoriesModel(categories: null));

        expect(
          () => repository.getCategories(),
          throwsA(isA<RecipesException>()),
        );
      },
    );

    test(
      'throws RecipesException.networkError on DioClientException',
      () async {
        when(
          mockDataSource.getCategories(),
        ).thenThrow(DioClientException('Network error'));

        expect(
          () => repository.getCategories(),
          throwsA(isA<RecipesException>()),
        );
      },
    );

    test('throws RecipesException.fetchFailed on unknown exception', () async {
      when(mockDataSource.getCategories()).thenThrow(Exception('Unknown'));

      expect(
        () => repository.getCategories(),
        throwsA(isA<RecipesException>()),
      );
    });
  });
}
