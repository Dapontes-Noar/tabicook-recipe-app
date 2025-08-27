import 'package:json_annotation/json_annotation.dart';
import 'package:tabi_cook/features/recipes/domain/entities/recipe.dart';

part 'recipe_model.g.dart';

@JsonSerializable(includeIfNull: false, ignoreUnannotated: true)
class RecipeModel {
  @JsonKey(name: 'idMeal', includeFromJson: true, includeToJson: true)
  final String? idMeal;
  @JsonKey(name: 'strMeal', includeFromJson: true, includeToJson: true)
  final String? strMeal;
  @JsonKey(name: 'strCategory', includeFromJson: true, includeToJson: true)
  final String? strCategory;
  @JsonKey(name: 'strArea', includeFromJson: true, includeToJson: true)
  final String? strArea;
  @JsonKey(name: 'strInstructions', includeFromJson: true, includeToJson: true)
  final String? strInstructions;
  @JsonKey(name: 'strMealThumb', includeFromJson: true, includeToJson: true)
  final String? strMealThumb;
  @JsonKey(name: 'strTags', includeFromJson: true, includeToJson: true)
  final String? strTags;
  @JsonKey(name: 'strYoutube', includeFromJson: true, includeToJson: true)
  final String? strYoutube;
  @IngredientsConverter()
  final List<String?>? ingredients;
  @MeasuresConverter()
  final List<String?>? measures;

  RecipeModel({
    this.idMeal,
    this.strMeal,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.ingredients,
    this.measures,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    final base = _$RecipeModelFromJson(json);
    return RecipeModel(
      idMeal: base.idMeal,
      strMeal: base.strMeal,
      strCategory: base.strCategory,
      strArea: base.strArea,
      strInstructions: base.strInstructions,
      strMealThumb: base.strMealThumb,
      strTags: base.strTags,
      strYoutube: base.strYoutube,
      ingredients: IngredientsConverter().fromJson(json),
      measures: MeasuresConverter().fromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    final data = _$RecipeModelToJson(this);
    data.addAll(IngredientsConverter().toJson(ingredients ?? []));
    data.addAll(MeasuresConverter().toJson(measures ?? []));
    return data;
  }

  /// Converts this [RecipeModel] into a [Recipe] entity.
  Recipe toEntity() => Recipe(
    id: idMeal ?? '',
    name: strMeal ?? '',
    thumbnail: strMealThumb ?? '',
    ingredientsCount: ingredients?.length ?? 0,
    ingredients: ingredients?.whereType<String>().toList() ?? [],
    measures: measures?.whereType<String>().toList() ?? [],
  );
}

class IngredientsConverter
    implements JsonConverter<List<String?>, Map<String, dynamic>> {
  const IngredientsConverter();

  @override
  List<String> fromJson(Map<String, dynamic> json) {
    return json.entries
        .where(
          (entry) =>
              entry.key.startsWith('strIngredient') &&
              entry.value != null &&
              entry.value is String? &&
              entry.value.isNotEmpty,
        )
        .map((entry) => entry.value as String)
        .toList();
  }

  @override
  Map<String, dynamic> toJson(List<String?> object) {
    final data = <String, dynamic>{};
    for (int i = 0; i < object.length; i++) {
      data['strIngredient${i + 1}'] = object[i];
    }
    return data;
  }
}

class MeasuresConverter
    implements JsonConverter<List<String?>, Map<String, dynamic>> {
  const MeasuresConverter();

  @override
  List<String> fromJson(Map<String, dynamic> json) {
    return json.entries
        .where(
          (entry) =>
              entry.key.startsWith('strMeasure') &&
              entry.value != null &&
              entry.value is String? &&
              entry.value.isNotEmpty,
        )
        .map((entry) => entry.value as String)
        .toList();
  }

  @override
  Map<String, dynamic> toJson(List<String?> object) {
    final data = <String, dynamic>{};
    for (int i = 0; i < object.length; i++) {
      data['strMeasure${i + 1}'] = object[i];
    }
    return data;
  }
}
