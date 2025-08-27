import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tabi_cook/core/utils/exceptions/recipes_exception.dart';
import 'package:tabi_cook/features/recipes/data/models/recipe_model.dart';
import 'package:tabi_cook/features/recipes/data/models/recipes_model.dart';
import 'package:tabi_cook/features/recipes/domain/entities/recipe.dart';
import 'package:tabi_cook/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:tabi_cook/features/recipes/domain/usecases/get_recipes_by_category_usecase.dart';

import 'get_recipes_by_category_usecase_test.mocks.dart';

@GenerateMocks([RecipesRepository])
void main() {
  late GetRecipesByCategoryUseCase useCase;
  late MockRecipesRepository mockRepository;

  setUp(() {
    mockRepository = MockRecipesRepository();
    useCase = GetRecipesByCategoryUseCase(mockRepository);
  });

  group('GetRecipesByCategoryUseCase', () {
    const category = 'Dessert';
    final recipeModel = RecipeModel(
      idMeal: '456',
      strMeal: 'Cake',
      strCategory: 'Dessert',
      strArea: 'French',
      strInstructions: 'Bake the cake.',
      strMealThumb: 'http://example.com/cake.jpg',
    );
    final recipesModel = RecipesModel(meals: [recipeModel]);
    final expectedRecipes = [
      Recipe(
        id: '456',
        name: 'Cake',
        thumbnail: 'http://example.com/cake.jpg',
        ingredientsCount: 2,
        ingredients: ['Sugar', 'Flour'],
        measures: ['1 cup', '2 cups'],
        isFavorite: false,
      ),
    ];

    test('returns list of recipes on success', () async {
      when(
        mockRepository.getRecipesByCategory(category),
      ).thenAnswer((_) async => recipesModel);

      final result = await useCase(category);

      expect(result.length, expectedRecipes.length);
      expect(result[0].id, expectedRecipes[0].id);
      verify(mockRepository.getRecipesByCategory(category)).called(1);
    });

    test(
      'throws RecipesException.noRecipesFound when no meals are found',
      () async {
        when(
          mockRepository.getRecipesByCategory(category),
        ).thenAnswer((_) async => RecipesModel(meals: null));

        expect(() => useCase(category), throwsA(isA<RecipesException>()));
        verify(mockRepository.getRecipesByCategory(category)).called(1);
      },
    );

    test(
      'throws RecipesException.noRecipesFound when meals list is empty',
      () async {
        when(
          mockRepository.getRecipesByCategory(category),
        ).thenAnswer((_) async => RecipesModel(meals: []));

        expect(() => useCase(category), throwsA(isA<RecipesException>()));
        verify(mockRepository.getRecipesByCategory(category)).called(1);
      },
    );
  });
}
