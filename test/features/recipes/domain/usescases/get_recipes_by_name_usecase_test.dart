import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tabi_cook/core/utils/exceptions/recipes_exception.dart';
import 'package:tabi_cook/features/recipes/data/models/recipe_model.dart';
import 'package:tabi_cook/features/recipes/data/models/recipes_model.dart';
import 'package:tabi_cook/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:tabi_cook/features/recipes/domain/usecases/get_recipes_by_name_usecase.dart';

import 'get_recipes_by_name_usecase_test.mocks.dart';

@GenerateMocks([RecipesRepository])
void main() {
  late GetRecipesByNameUseCase useCase;
  late MockRecipesRepository mockRepository;

  setUp(() {
    mockRepository = MockRecipesRepository();
    useCase = GetRecipesByNameUseCase(mockRepository);
  });

  group('GetRecipesByNameUseCase', () {
    const name = 'Pizza';
    final recipeModel = RecipeModel(
      idMeal: '789',
      strMeal: 'Pizza',
      strCategory: 'Main Course',
      strArea: 'Italian',
      strInstructions: 'Bake the pizza.',
      strMealThumb: 'http://example.com/pizza.jpg',
    );
    final recipesModel = RecipesModel(meals: [recipeModel]);

    test('returns RecipesModel on success', () async {
      when(mockRepository.getRecipesByName(name)).thenAnswer((_) async => recipesModel);

      final result = await useCase(name);

      expect(result, recipesModel);
      verify(mockRepository.getRecipesByName(name)).called(1);
    });

    test('throws RecipesException.noRecipesByName when no meals are found', () async {
      when(mockRepository.getRecipesByName(name)).thenAnswer((_) async => RecipesModel(meals: null));

      expect(
            () => useCase(name),
        throwsA(isA<RecipesException>()),
      );
      verify(mockRepository.getRecipesByName(name)).called(1);
    });

    test('throws RecipesException.noRecipesByName when meals list is empty', () async {
      when(mockRepository.getRecipesByName(name)).thenAnswer((_) async => RecipesModel(meals: []));

      expect(
            () => useCase(name),
        throwsA(isA<RecipesException>()),
      );
      verify(mockRepository.getRecipesByName(name)).called(1);
    });
  });
}