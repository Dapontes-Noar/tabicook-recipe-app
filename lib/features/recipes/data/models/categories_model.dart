import 'package:json_annotation/json_annotation.dart';
import 'package:tabi_cook/features/recipes/data/models/category_model.dart';
import 'package:tabi_cook/features/recipes/domain/entities/category.dart';

part 'categories_model.g.dart';

/// Model representing a list of categories
@JsonSerializable(includeIfNull: false)
class CategoriesModel {
  @JsonKey(name: 'categories')
  final List<CategoryModel>? categories;

  CategoriesModel({this.categories});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);

  List<Category> toEntityList() =>
      categories?.map((e) => e.toEntity()).toList() ?? [];
}
