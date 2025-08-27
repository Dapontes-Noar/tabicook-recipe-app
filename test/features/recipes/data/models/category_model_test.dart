import 'package:flutter_test/flutter_test.dart';
import 'package:tabi_cook/features/recipes/data/models/category_model.dart';
import 'package:tabi_cook/features/recipes/domain/entities/category.dart';

void main() {
  group('CategoryModel', () {
    final json = {
      'idCategory': '1',
      'strCategory': 'Dessert',
      'strCategoryThumb': 'https://example.com/image.jpg',
      'strCategoryDescription': 'Sweet treats',
    };

    final model = CategoryModel(
      idCategory: '1',
      strCategory: 'Dessert',
      strCategoryThumb: 'https://example.com/image.jpg',
      strCategoryDescription: 'Sweet treats',
    );

    test('fromJson creates a valid model', () {
      final result = CategoryModel.fromJson(json);
      expect(result.idCategory, model.idCategory);
      expect(result.strCategory, model.strCategory);
      expect(result.strCategoryThumb, model.strCategoryThumb);
      expect(result.strCategoryDescription, model.strCategoryDescription);
    });

    test('toJson returns correct map', () {
      final result = model.toJson();
      expect(result, json);
    });

    test('toEntity converts to Category entity', () {
      final entity = model.toEntity();
      expect(entity, isA<Category>());
      expect(entity.id, model.idCategory);
      expect(entity.name, model.strCategory);
      expect(entity.image, model.strCategoryThumb);
    });
  });
}