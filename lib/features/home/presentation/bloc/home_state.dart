import 'package:equatable/equatable.dart';
import 'package:tabi_cook/features/recipes/domain/entities/category.dart';
import 'package:tabi_cook/features/recipes/domain/entities/recipe.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadInProgress extends HomeState {}

class HomeLoadSuccess extends HomeState {
  final List<Category> categories;
  final List<Recipe> recipes;

  const HomeLoadSuccess(this.categories, this.recipes);

  @override
  List<Object?> get props => [categories, recipes];
}

class HomeLoadRecipes extends HomeState {
  final List<Recipe> recipes;

  const HomeLoadRecipes(this.recipes);

  @override
  List<Object?> get props => [recipes];
}

class HomeLoadCategories extends HomeState {
  final List<Category> categories;

  const HomeLoadCategories(this.categories);

  @override
  List<Object?> get props => [categories];
}

class HomeSelectCategory extends HomeState {
  final String categoryId;

  const HomeSelectCategory(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}

class HomeLoadFailure extends HomeState {
  final String message;

  const HomeLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}
