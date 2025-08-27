import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  final String id;
  final String name;
  final String thumbnail;
  final String instructions;
  final int ingredientsCount;
  final List<String> ingredients;
  final List<String> measures;
  final bool isFavorite;

  const Recipe({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.instructions,
    required this.ingredientsCount,
    required this.ingredients,
    required this.measures,
    this.isFavorite = false,
  });

  Recipe copyWith({bool? isFavorite}) => Recipe(
    id: id,
    name: name,
    thumbnail: thumbnail,
    instructions: instructions,
    ingredientsCount: ingredientsCount,
    ingredients: ingredients,
    measures: measures,
    isFavorite: isFavorite ?? this.isFavorite,
  );

  @override
  List<Object?> get props => [
    id,
    name,
    thumbnail,
    instructions,
    ingredientsCount,
    ingredients,
    measures,
    isFavorite,
  ];
}
