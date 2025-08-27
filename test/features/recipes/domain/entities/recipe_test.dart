import 'package:flutter_test/flutter_test.dart';
import 'package:tabi_cook/features/recipes/domain/entities/recipe.dart';

void main() {
  group('Recipe', () {
    const recipe = Recipe(
      id: '1',
      name: 'Pizza',
      thumbnail: 'https://example.com/image.jpg',
      instructions: 'Bake it',
      ingredientsCount: 2,
      ingredients: ['Cheese', 'Tomato'],
      measures: ['200g', '100g'],
      isFavorite: false,
    );

    test('supports value equality', () {
      const anotherRecipe = Recipe(
        id: '1',
        name: 'Pizza',
        thumbnail: 'https://example.com/image.jpg',
        ingredientsCount: 2,
        instructions: 'Bake it',
        ingredients: ['Cheese', 'Tomato'],
        measures: ['200g', '100g'],
        isFavorite: false,
      );

      expect(recipe, equals(anotherRecipe));
    });

    test('copyWith updates isFavorite', () {
      final updatedRecipe = recipe.copyWith(isFavorite: true);

      expect(updatedRecipe.isFavorite, true);
      expect(updatedRecipe.id, recipe.id);
      expect(updatedRecipe.name, recipe.name);
      expect(updatedRecipe.thumbnail, recipe.thumbnail);
      expect(updatedRecipe.ingredientsCount, recipe.ingredientsCount);
      expect(updatedRecipe.ingredients, recipe.ingredients);
      expect(updatedRecipe.measures, recipe.measures);
    });

    test('copyWith retains original values if no changes', () {
      final updatedRecipe = recipe.copyWith();

      expect(updatedRecipe, equals(recipe));
    });
  });
}
