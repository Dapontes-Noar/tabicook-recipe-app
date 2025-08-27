import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tabi_cook/core/utils/exceptions/recipes_exception.dart';
import 'package:tabi_cook/features/recipes/data/models/recipe_model.dart';
import 'package:tabi_cook/features/recipes/data/models/recipes_model.dart';
import 'package:tabi_cook/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:tabi_cook/features/recipes/domain/usecases/get_recipe_by_id_usecase.dart';

import 'get_recipe_by_id_usecase_test.mocks.dart';

@GenerateMocks([RecipesRepository])
void main() {
  late GetRecipeByIdUseCase useCase;
  late MockRecipesRepository mockRepository;

  setUp(() {
    mockRepository = MockRecipesRepository();
    useCase = GetRecipeByIdUseCase(mockRepository);
  });

  group('GetRecipeByIdUseCase', () {
    const id = '123';
    final recipeModel = RecipeModel(
      idMeal: '123',
      strMeal: 'Pasta',
      strCategory: 'Main Course',
      strArea: 'Italian',
      strInstructions: 'Cook pasta. Add sauce.',
      strMealThumb: 'http://example.com/pasta.jpg',
    );
    final recipesModel = RecipesModel(meals: [recipeModel]);

    test('returns RecipeModel on success', () async {
      when(mockRepository.getRecipesById(id)).thenAnswer((_) async => recipesModel);

      final result = await useCase(id);

      expect(result, recipeModel);
      verify(mockRepository.getRecipesById(id)).called(1);
    });

    test('throws RecipesException.noRecipesFound when no meals are found', () async {
      when(mockRepository.getRecipesById(id)).thenAnswer((_) async => RecipesModel(meals: null));

      expect(
            () => useCase(id),
        throwsA(isA<RecipesException>()),
      );
      verify(mockRepository.getRecipesById(id)).called(1);
    });

    test('throws RecipesException.noRecipesFound when meals list is empty', () async {
      when(mockRepository.getRecipesById(id)).thenAnswer((_) async => RecipesModel(meals: []));

      expect(
            () => useCase(id),
        throwsA(isA<RecipesException>()),
      );
      verify(mockRepository.getRecipesById(id)).called(1);
    });
  });
}