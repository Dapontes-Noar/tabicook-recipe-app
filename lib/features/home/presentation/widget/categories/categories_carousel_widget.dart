import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabi_cook/features/home/presentation/bloc/home_bloc.dart';
import 'package:tabi_cook/features/home/presentation/bloc/home_state.dart';
import 'package:tabi_cook/features/home/presentation/widget/categories/categories_card_widget.dart';
import 'package:tabi_cook/styles/app_styles.dart';

class CategoryCarouselWidget extends StatefulWidget {
  const CategoryCarouselWidget({super.key});

  @override
  State<CategoryCarouselWidget> createState() => _CategoryCarouselWidgetState();
}

class _CategoryCarouselWidgetState extends State<CategoryCarouselWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
      if (state is HomeLoadSuccess) {
        return SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            hitTestBehavior: HitTestBehavior.translucent,
            padding: EdgeInsets.symmetric(horizontal: $appStyles.padding.m),
            itemCount: state.categories.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final c = state.categories[index];
              return CategoriesCardWidget(
                category: c,
                selected: false,
                onTap: () {},
              );
            },
          ),
        );
      } else if (state is HomeLoadFailure) {
        return Center(child: Text(state.message));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
  );
}
