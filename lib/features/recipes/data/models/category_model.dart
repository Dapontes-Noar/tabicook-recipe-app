import 'package:json_annotation/json_annotation.dart';
import 'package:tabi_cook/features/recipes/domain/entities/category.dart';

part 'category_model.g.dart';

/// Model representing a single category
@JsonSerializable(includeIfNull: false)
class CategoryModel {
  @JsonKey(name: 'categories')
  final String? idCategory;
  @JsonKey(name: 'strCategory')
  final String? strCategory;
  @JsonKey(name: 'strCategoryThumb')
  final String? strCategoryThumb;
  @JsonKey(name: 'strCategoryDescription')
  final String? strCategoryDescription;

  CategoryModel({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  Category toEntity() => Category(
    id: idCategory ?? '',
    name: strCategory ?? '',
    image: strCategoryThumb ?? '',
  );
}
