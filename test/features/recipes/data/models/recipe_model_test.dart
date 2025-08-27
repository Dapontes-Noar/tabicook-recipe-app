import 'package:flutter_test/flutter_test.dart';
import 'package:tabi_cook/features/recipes/data/models/recipe_model.dart';
import 'package:tabi_cook/features/recipes/domain/entities/recipe.dart';

void main() {
  group('RecipeModel', () {
    final json = {
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
    };

    final model = RecipeModel(
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

    test('fromJson creates a valid model', () {
      final result = RecipeModel.fromJson(json);
      expect(result.idMeal, model.idMeal);
      expect(result.strMeal, model.strMeal);
      expect(result.strCategory, model.strCategory);
      expect(result.strArea, model.strArea);
      expect(result.strInstructions, model.strInstructions);
      expect(result.strMealThumb, model.strMealThumb);
      expect(result.strTags, model.strTags);
      expect(result.strYoutube, model.strYoutube);
      expect(result.ingredients, model.ingredients);
      expect(result.measures, model.measures);
    });

    test('toJson returns correct map', () {
      final result = model.toJson();
      expect(result['idMeal'], json['idMeal']);
      expect(result['strMeal'], json['strMeal']);
      expect(result['strCategory'], json['strCategory']);
      expect(result['strArea'], json['strArea']);
      expect(result['strInstructions'], json['strInstructions']);
      expect(result['strMealThumb'], json['strMealThumb']);
      expect(result['strTags'], json['strTags']);
      expect(result['strYoutube'], json['strYoutube']);
      expect(result['strIngredient1'], json['strIngredient1']);
      expect(result['strIngredient2'], json['strIngredient2']);
      expect(result['strMeasure1'], json['strMeasure1']);
      expect(result['strMeasure2'], json['strMeasure2']);
    });

    test('toEntity converts to Recipe entity', () {
      final entity = model.toEntity();
      expect(entity, isA<Recipe>());
      expect(entity.id, model.idMeal);
      expect(entity.name, model.strMeal);
      expect(entity.thumbnail, model.strMealThumb);
      expect(entity.ingredientsCount, model.ingredients?.length);
      expect(
        entity.ingredients,
        model.ingredients?.whereType<String>().toList(),
      );
      expect(entity.measures, model.measures?.whereType<String>().toList());
    });
  });
}
