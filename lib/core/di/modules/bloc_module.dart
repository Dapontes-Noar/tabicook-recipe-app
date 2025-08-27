import 'package:injectable/injectable.dart';
import 'package:tabi_cook/core/di/injector.dart';
import 'package:tabi_cook/features/home/presentation/bloc/home_bloc.dart';
import 'package:tabi_cook/features/recipes/domain/usecases/get_categories_usecase.dart';
import 'package:tabi_cook/features/recipes/domain/usecases/get_recipes_by_category_usecase.dart';

@module
abstract class BlocModule {
  // Register your BLoCs here
  @factoryMethod
  HomeBloc homeBloc() => HomeBloc(
    getIt<GetCategoriesUseCase>(),
    getIt<GetRecipesByCategoryUseCase>(),
  );
}
