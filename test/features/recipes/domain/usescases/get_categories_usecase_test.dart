import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tabi_cook/core/utils/exceptions/recipes_exception.dart';
import 'package:tabi_cook/features/recipes/data/models/categories_model.dart';
import 'package:tabi_cook/features/recipes/data/models/category_model.dart';
import 'package:tabi_cook/features/recipes/domain/entities/category.dart';
import 'package:tabi_cook/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:tabi_cook/features/recipes/domain/usecases/get_categories_usecase.dart';

import 'get_categories_usecase_test.mocks.dart';

@GenerateMocks([RecipesRepository])
void main() {
  late GetCategoriesUseCase useCase;
  late MockRecipesRepository mockRepository;

  setUp(() {
    mockRepository = MockRecipesRepository();
    useCase = GetCategoriesUseCase(mockRepository);
  });

  group('GetCategoriesUseCase', () {
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

    final expectedCategories = [
      Category(
        id: '1',
        name: 'Dessert',
        image: 'http://example.com/dessert.jpg',
      ),
    ];

    test('returns list of categories on success', () async {
      when(
        mockRepository.getCategories(),
      ).thenAnswer((_) async => categoriesModel);

      final result = await useCase();

      expect(result.length, expectedCategories.length);
      expect(result[0].id, expectedCategories[0].id);
      verify(mockRepository.getCategories()).called(1);
    });

    test(
      'throws RecipesException.noCategoriesFound when no categories are found',
      () async {
        when(
          mockRepository.getCategories(),
        ).thenAnswer((_) async => CategoriesModel(categories: null));

        expect(() => useCase(), throwsA(isA<RecipesException>()));
        verify(mockRepository.getCategories()).called(1);
      },
    );

    test(
      'throws RecipesException.noCategoriesFound when categories list is empty',
      () async {
        when(
          mockRepository.getCategories(),
        ).thenAnswer((_) async => CategoriesModel(categories: []));

        expect(() => useCase(), throwsA(isA<RecipesException>()));
        verify(mockRepository.getCategories()).called(1);
      },
    );
  });
}
