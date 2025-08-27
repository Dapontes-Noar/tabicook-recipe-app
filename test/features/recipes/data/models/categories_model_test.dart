import 'package:flutter_test/flutter_test.dart';
import 'package:tabi_cook/features/recipes/data/models/categories_model.dart';
import 'package:tabi_cook/features/recipes/data/models/category_model.dart';

void main() {
  group('CategoriesModel', () {
    final json = {
      "categories": [
        {
          "idCategory": "1",
          "strCategory": "Beef",
          "strCategoryThumb":
              "https://www.themealdb.com/images/category/beef.png",
          "strCategoryDescription":
              "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]",
        },
      ],
    };

    final model = CategoriesModel(
      categories: [
        CategoryModel(
          idCategory: "1",
          strCategory: "Beef",
          strCategoryThumb:
              "https://www.themealdb.com/images/category/beef.png",
          strCategoryDescription:
              "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]",
        ),
      ],
    );

    test('fromJson creates a valid model', () {
      final result = CategoriesModel.fromJson(json);
      expect(result.categories?.length, 1);
      expect(result.categories?.first.idCategory, '1');
    });

    test('toJson returns correct map', () {
      final result = model.toJson();
      expect(result, json);
    });

    test('toEntityList converts to domain entities', () {
      final entities = model.toEntityList();
      expect(entities.length, 1);
      expect(entities.first.name, 'Beef');
    });
  });
}
