import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabi_cook/core/utils/extensions/context_extensions.dart';
import 'package:tabi_cook/features/home/presentation/bloc/home_bloc.dart';
import 'package:tabi_cook/features/home/presentation/bloc/home_event.dart';
import 'package:tabi_cook/features/home/presentation/widget/app_bar_widget.dart';
import 'package:tabi_cook/features/home/presentation/widget/bottom_navigation_bar_widget.dart';
import 'package:tabi_cook/features/home/presentation/widget/categories/categories_carousel_widget.dart';
import 'package:tabi_cook/features/home/presentation/widget/recipes/recipe_carousel_widget.dart';
import 'package:tabi_cook/features/home/presentation/widget/search_bar_widget.dart';
import 'package:tabi_cook/styles/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeBloc>();
    _bloc.add(const HomeRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(),
      bottomNavigationBar: BottomNavigationBarWidget(),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  /// Builds the main body of the screen.
  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: SearchBarWidget()),
          _verticalSpacing(40),
          const CategoryCarouselWidget(),
          _verticalSpacing(40),
          _buildRecommendedTitle(context),
          _verticalSpacing(25),
          const RecipeCarouselWidget(),
        ],
      ),
    );
  }

  /// Builds the recommended title section.
  Widget _buildRecommendedTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: $appStyles.padding.m),
      child: Text(
        context.l10n.homeRecommendedTitle,
        style: $appStyles.text.title,
      ),
    );
  }

  /// Creates vertical spacing.
  Widget _verticalSpacing(double height) => SizedBox(height: height);
}
