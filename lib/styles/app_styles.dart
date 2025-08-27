import 'package:flutter/material.dart';
import 'package:tabi_cook/styles/app_colors.dart';

/// Centralized application styles including text styles, colors, padding, and container styles.
@immutable
class AppStyles {
  late final text = _Text();
  late final AppColors colors = AppColors();
  late final padding = _Padding();
  late final containerStyles = _ContainerStyles(_BorderStyle());
}

/// Text styles used throughout the app.
@immutable
class _Text {
  final TextStyle font = const TextStyle(fontFamily: 'Nunito');
  final String? fontFamily = 'Nunito';

  late final TextStyle heading1;
  late final TextStyle button1;
  late final TextStyle title;
  late final TextStyle description1;
  late final TextStyle description2;

  _Text() {
    heading1 = font.copyWith(
      color: $appStyles.colors.black,
      fontSize: 30,
      fontWeight: FontWeight.w900,
      height: 1,
    );

    button1 = font.copyWith(
      color: $appStyles.colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1,
    );

    title = font.copyWith(
      color: $appStyles.colors.textPrimary,
      fontSize: 20,
      fontWeight: FontWeight.w900,
      height: 1,
    );

    description1 = font.copyWith(
      color: $appStyles.colors.textPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.2,
    );

    description2 = font.copyWith(
      color: $appStyles.colors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.2,
    );
  }
}

/// Padding values used for consistent spacing throughout the app.
class _Padding {
  final xxl = 100.0;
  final xl = 80.0;
  final l = 60.0;
  final m = 30.0;
  final s = 15.0;
  final xs = 10.0;
  final xxs = 6.0;
}

/// Container styles including shapes and border radii.
class _ContainerStyles {
  final BoxDecoration circular = const BoxDecoration(shape: BoxShape.circle);
  final BoxDecoration rounded;

  _ContainerStyles(_BorderStyle borderStyle)
    : rounded = BoxDecoration(borderRadius: borderStyle.roundedBorderRadius);
}

/// Border styles including colors, widths, and border radii.
class _BorderStyle {
  final Color stroke = $appStyles.colors.primaryYellow;
  final double width = 1;
  final BorderRadius favoriteBorderRadius = BorderRadius.circular(8);
  final BorderRadius roundedBorderRadius = BorderRadius.circular(16);
  final BorderRadius roundedBottomContainerRadius = const BorderRadius.only(
    topLeft: Radius.circular(32),
    topRight: Radius.circular(32),
  );
  final BorderRadius roundedOptionsContainerRadius = const BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
  );
}

/// Singleton instance of AppStyles for global access.
final AppStyles $appStyles = AppStyles();
