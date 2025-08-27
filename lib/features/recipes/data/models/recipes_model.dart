import 'package:json_annotation/json_annotation.dart';
import 'package:tabi_cook/features/recipes/data/models/recipe_model.dart';
import 'package:tabi_cook/features/recipes/domain/entities/recipe.dart';

part 'recipes_model.g.dart';

@JsonSerializable(includeIfNull: false)
class RecipesModel {
  @JsonKey(name: 'meals')
  final List<RecipeModel>? meals;

  RecipesModel({this.meals});

  factory RecipesModel.fromJson(Map<String, dynamic> json) =>
      _$RecipesModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipesModelToJson(this);

  List<Recipe> toEntityList() => meals?.map((e) => e.toEntity()).toList() ?? [];
}
