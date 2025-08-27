import 'package:flutter/material.dart';
import 'package:tabi_cook/features/recipes/domain/entities/recipe.dart';

class FavoriteButtonWidget extends StatelessWidget {
  final VoidCallback? onFavoriteTap;
  final Recipe recipe;

  const FavoriteButtonWidget({
    super.key,
    this.onFavoriteTap,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) => Positioned(
    bottom: 10,
    right: 10,
    child: Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () {
          onFavoriteTap?.call();
        },
        customBorder: const CircleBorder(),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black38,
            shape: BoxShape.circle,
          ),
          child: Icon(
            recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: recipe.isFavorite ? Colors.redAccent : Colors.white,
            size: 20,
          ),
        ),
      ),
    ),
  );
}
