import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeRequested extends HomeEvent {
  const HomeRequested();
}

class HomeRefreshRequested extends HomeEvent {
  const HomeRefreshRequested();
}

class HomeCategorySelected extends HomeEvent {
  final String categoryId;

  const HomeCategorySelected(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}

class HomeToggleFavorite extends HomeEvent {
  final String recipeId;

  const HomeToggleFavorite(this.recipeId);

  @override
  List<Object?> get props => [recipeId];
}
