import 'package:flutter_test/flutter_test.dart';
import 'package:tabi_cook/features/recipes/data/models/recipes_model.dart';
import 'package:tabi_cook/features/recipes/data/models/recipe_model.dart';
import 'package:tabi_cook/features/recipes/domain/entities/recipe.dart';

void main() {
  group('RecipesModel', () {
    final json = {
      'meals': [
        {
          'idMeal': '123',
          'strMeal': 'Pizza',
          'strCategory': 'Italian',
          'strArea': 'Italy',
          'strInstructions': 'Bake it.',
          'strMealThumb': 'https://example.com/image.jpg',
          'strTags': 'FastFood',
          'strYoutube': 'https://youtube.com/example',
          'strIngredient1': 'Cheese',
          'strIngredient2': 'Tomato',
          'strMeasure1': '200g',
          'strMeasure2': '100g',
        }
      ]
    };

    final recipeModel = RecipeModel(
      idMeal: '123',
      strMeal: 'Pizza',
      strCategory: 'Italian',
      strArea: 'Italy',
      strInstructions: 'Bake it.',
      strMealThumb: 'https://example.com/image.jpg',
      strTags: 'FastFood',
      strYoutube: 'https://youtube.com/example',
      ingredients: ['Cheese', 'Tomato'],
      measures: ['200g', '100g'],
    );

    final model = RecipesModel(meals: [recipeModel]);

    test('fromJson creates a valid model', () {
      final result = RecipesModel.fromJson(json);
      expect(result.meals?.length, 1);
      expect(result.meals?.first.idMeal, recipeModel.idMeal);
    });

    test('toJson returns correct map', () {
      final result = model.toJson();
      expect(result['meals']?.length, 1);
      expect(result['meals']?.first['idMeal'], json['meals']?.first['idMeal']);
    });

    test('toEntityList converts to list of Recipe entities', () {
      final entities = model.toEntityList();
      expect(entities.length, 1);
      expect(entities.first, isA<Recipe>());
      expect(entities.first.id, recipeModel.idMeal);
    });
  });
}