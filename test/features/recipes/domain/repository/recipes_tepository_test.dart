import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tabi_cook/features/recipes/data/models/categories_model.dart';
import 'package:tabi_cook/features/recipes/data/models/recipes_model.dart';
import 'package:tabi_cook/features/recipes/domain/repositories/recipes_repository.dart';

import 'recipes_tepository_test.mocks.dart';

@GenerateMocks([RecipesRepository])
void main() {
  late MockRecipesRepository mockRepository;

  setUp(() {
    mockRepository = MockRecipesRepository();
  });

  group('RecipesRepository', () {
    const id = '123';
    const name = 'Pizza';
    const category = 'Dessert';
    final recipesModel = RecipesModel(meals: []);
    final categoriesModel = CategoriesModel(categories: []);

    test('getRecipesById returns RecipesModel', () async {
      when(mockRepository.getRecipesById(id)).thenAnswer((_) async => recipesModel);

      final result = await mockRepository.getRecipesById(id);

      expect(result, recipesModel);
      verify(mockRepository.getRecipesById(id)).called(1);
    });

    test('getRecipesByName returns RecipesModel', () async {
      when(mockRepository.getRecipesByName(name)).thenAnswer((_) async => recipesModel);

      final result = await mockRepository.getRecipesByName(name);

      expect(result, recipesModel);
      verify(mockRepository.getRecipesByName(name)).called(1);
    });

    test('getRecipesByCategory returns RecipesModel', () async {
      when(mockRepository.getRecipesByCategory(category)).thenAnswer((_) async => recipesModel);

      final result = await mockRepository.getRecipesByCategory(category);

      expect(result, recipesModel);
      verify(mockRepository.getRecipesByCategory(category)).called(1);
    });

    test('getCategories returns CategoriesModel', () async {
      when(mockRepository.getCategories()).thenAnswer((_) async => categoriesModel);

      final result = await mockRepository.getCategories();

      expect(result, categoriesModel);
      verify(mockRepository.getCategories()).called(1);
    });
  });
}