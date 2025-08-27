import 'package:flutter/material.dart';
import 'package:tabi_cook/features/home/presentation/widget/favorites/favorite_button_widget.dart';
import 'package:tabi_cook/features/recipes/domain/entities/recipe.dart';
import 'package:tabi_cook/shared/app_images.dart';
import 'package:tabi_cook/styles/app_styles.dart';

class RecipeCardWidget extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final double borderRadius;

  const RecipeCardWidget({
    super.key,
    required this.recipe,
    this.onTap,
    this.onFavoriteTap,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(context),
            const SizedBox(height: 12),
            _buildTitle(),
            const SizedBox(height: 6),
            _buildMetaRow(),
          ],
        ),
      ),
    );
  }

  /// Builds the image section with a Hero animation and favorite button.
  Widget _buildImageSection(BuildContext context) {
    return Flexible(
      flex: 15,
      child: Stack(
        children: [
          Hero(
            tag: 'recipe-image-${recipe.id}',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Semantics(
                label: '${recipe.name} image',
                image: true,
                child: FadeInImage.assetNetwork(
                  placeholder: AppImages.placeholderFood,
                  placeholderFit: BoxFit.scaleDown,
                  image: recipe.thumbnail,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  imageErrorBuilder: (ctx, error, stackTrace) =>
                      _buildImageErrorPlaceholder(context),
                ),
              ),
            ),
          ),
          FavoriteButtonWidget(recipe: recipe, onFavoriteTap: onFavoriteTap),
        ],
      ),
    );
  }

  /// Builds the title section.
  Widget _buildTitle() {
    return Flexible(
      flex: 1,
      child: Text(
        recipe.name,
        style: $appStyles.text.description1,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// Builds the metadata row (e.g., ingredients count).
  Widget _buildMetaRow() {
    return Flexible(
      flex: 1,
      child: Text(
        '${recipe.ingredientsCount} ingredients',
        style: $appStyles.text.description2,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// Builds a placeholder for image errors.
  Widget _buildImageErrorPlaceholder(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      child: const Center(child: Icon(Icons.broken_image, size: 40)),
    );
  }
}
