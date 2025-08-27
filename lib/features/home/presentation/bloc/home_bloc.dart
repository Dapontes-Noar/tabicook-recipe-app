import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabi_cook/features/recipes/domain/entities/category.dart';
import 'package:tabi_cook/features/recipes/domain/usecases/get_categories_usecase.dart';
import 'package:tabi_cook/features/recipes/domain/usecases/get_recipes_by_category_usecase.dart';
import 'package:tabi_cook/features/recipes/domain/entities/recipe.dart';
import 'package:flutter/material.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCategoriesUseCase getCategories;
  final GetRecipesByCategoryUseCase getRecipesByCategory;
  final ScrollController scrollController = ScrollController();
  final random = Random();
  List<Category> categories = [];
  List<Recipe> recipes = [];

  HomeBloc(this.getCategories, this.getRecipesByCategory)
    : super(HomeInitial()) {
    on<HomeRequested>(_onRequested);
    on<HomeRefreshRequested>(_onRefresh);
    on<HomeToggleFavorite>(_onToggleFavorite);
  }

  Future<void> _onRequested(HomeRequested _, Emitter<HomeState> emit) async {
    emit(HomeLoadInProgress());
    try {
      await getCategories.call().then((categoriesResponse) async {
        if (categoriesResponse.isNotEmpty) {
          categories.addAll(categoriesResponse);
          await getRecipesByCategory
              .call(categories[random.nextInt(categories.length)].name ?? '')
              .then((recipesResponse) {
                if (recipesResponse.isNotEmpty) {
                  recipes.addAll(recipesResponse);
                  emit(HomeLoadSuccess(categories, recipes));
                } else {
                  emit(HomeLoadFailure('No recipes found for the category.'));
                }
              })
              .catchError((error) {
                emit(HomeLoadFailure(error.toString()));
              });
        }
      });
    } catch (e) {
      emit(HomeLoadFailure(e.toString()));
    }
  }

  Future<void> _onRefresh(
    HomeRefreshRequested _,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoadCategories(categories));
      emit(HomeLoadRecipes(recipes));
    } catch (e) {
      emit(HomeLoadFailure(e.toString()));
    }
  }

  Future<void> _onToggleFavorite(
    HomeToggleFavorite event,
    Emitter<HomeState> emit,
  ) async {
    final current = state;
    if (current is HomeLoadRecipes) {
      // optimistic UI update
      final updated = current.recipes.map((r) {
        return r.id == event.recipeId
            ? r.copyWith(isFavorite: !r.isFavorite)
            : r;
      }).toList();
      emit(HomeLoadRecipes(updated));
    }
    try {
      //  await toggleFavorite(event.recipeId);
    } catch (e) {
      // optional: revert or notify via a separate state/side-effect
    }
  }
}
