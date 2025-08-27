import 'package:flutter/material.dart';
import 'package:tabi_cook/core/utils/constants/app_constants.dart';
import 'package:tabi_cook/features/recipes/domain/entities/category.dart';
import 'package:tabi_cook/shared/app_images.dart';
import 'package:tabi_cook/styles/app_styles.dart';

class CategoriesCardWidget extends StatelessWidget {
  final Category category;
  final bool selected;
  final VoidCallback? onTap;

  const CategoriesCardWidget({
    super.key,
    required this.category,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.width * 0.25,
        decoration: _buildBoxDecoration(),
        child: ClipRRect(
          borderRadius: _borderRadius,
          child: Stack(
            children: [if (_hasImage) _buildImage(context), _buildTitle()],
          ),
        ),
      ),
    );
  }

  /// Builds the box decoration for the card.
  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      gradient: $appStyles.colors.gradientYellow,
      borderRadius: _borderRadius,
      boxShadow: [_boxShadow],
      border: selected ? Border.all(color: Colors.white, width: 2) : null,
    );
  }

  /// Builds the title widget.
  Widget _buildTitle() {
    return Positioned(
      left: 12,
      bottom: 12,
      right: 12,
      child: Text(
        category.name ?? '',
        style: $appStyles.text.button1,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// Builds the image widget.
  Widget _buildImage(BuildContext context) {
    final double imageSize = MediaQuery.of(context).size.width * 0.25;
    return Positioned(
      top: -20,
      right: -20,
      width: imageSize * 0.9,
      height: imageSize * 0.9,
      child: IgnorePointer(
        child: Hero(
          tag: 'category-image-${category.id}',
          child: ImageWidget(urlOrAsset: category.image!),
        ),
      ),
    );
  }

  /// Checks if the category has a valid image.
  bool get _hasImage => category.image != null && category.image!.isNotEmpty;

  /// Returns the border radius for the card.
  BorderRadius get _borderRadius => BorderRadius.circular(14);

  /// Returns the box shadow for the card.
  BoxShadow get _boxShadow => BoxShadow(
    color: $appStyles.colors.cardShadows,
    blurRadius: 5,
    offset: const Offset(0, 6),
  );
}

/// Helper widget for displaying images with a placeholder.
class ImageWidget extends StatelessWidget {
  final String urlOrAsset;

  const ImageWidget({super.key, required this.urlOrAsset});

  bool _isNetwork(String url) {
    return url.startsWith(AppConstants.httpString) ||
        url.startsWith(AppConstants.httpsString);
  }

  @override
  Widget build(BuildContext context) {
    if (_isNetwork(urlOrAsset)) {
      return FadeInImage.assetNetwork(
        placeholder: AppImages.placeholderFood,
        image: urlOrAsset,
        fit: BoxFit.contain,
        imageErrorBuilder: (context, error, stackTrace) =>
            Image.asset(AppImages.placeholderFood, fit: BoxFit.cover),
      );
    } else {
      return Image.asset(urlOrAsset, fit: BoxFit.cover);
    }
  }
}
