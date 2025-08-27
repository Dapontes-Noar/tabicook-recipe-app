import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabi_cook/core/utils/extensions/context_extensions.dart';
import 'package:tabi_cook/features/home/presentation/bloc/home_bloc.dart';
import 'package:tabi_cook/features/home/presentation/bloc/home_event.dart';
import 'package:tabi_cook/features/home/presentation/bloc/home_state.dart';
import 'package:tabi_cook/features/home/presentation/widget/recipes/recipe_card_widget.dart';
import 'package:tabi_cook/styles/app_styles.dart';

class RecipeCarouselWidget extends StatefulWidget {
  const RecipeCarouselWidget({super.key});

  @override
  State<RecipeCarouselWidget> createState() => _RecipeCarouselWidgetState();
}

class _RecipeCarouselWidgetState extends State<RecipeCarouselWidget> {
  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
      if (state is HomeLoadSuccess) {
        return Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: state.recipes.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            padding: EdgeInsets.only(left: $appStyles.padding.m),
            itemBuilder: (context, i) {
              final r = state.recipes[i];
              return RecipeCardWidget(
                recipe: r,
                onTap: () {},
                onFavoriteTap: () =>
                    context.read<HomeBloc>().add(HomeToggleFavorite(r.id)),
              );
            },
          ),
        );
      } else if (state is HomeLoadFailure) {
        return Center(
          child: Text('${context.l10n.notFindRecipes} ${state.message}'),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
  );
}
