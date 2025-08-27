import 'package:flutter/material.dart';

/// A class that defines the color scheme and colors used in the app.
class AppColors {
  final Color primaryYellow = const Color.fromRGBO(255, 154, 0, 1);
  final Color ligthYellow = const Color.fromRGBO(255, 154, 0, 0.6);
  final Color background = const Color.fromRGBO(245, 245, 245, 1);
  final Color textPrimary = const Color.fromRGBO(67, 50, 50, 1);
  final Color white = const Color.fromRGBO(255, 255, 255, 1);
  final Color black = const Color.fromRGBO(0, 0, 0, 1);
  final Color grey = const Color.fromRGBO(112, 112, 112, 1);
  final Color cardShadows = const Color.fromRGBO(0, 0, 0, 0.2);
  final Gradient gradientYellow = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [const Color(0xFFFF9A00), const Color(0x9FFF9A00)],
    stops: const [0.0, 1.0],
  );

  final bool isDark = false;

  ColorScheme toColorScheme() {
    ColorScheme colorScheme = ColorScheme(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primary: primaryYellow,
      secondary: textPrimary,
      tertiary: ligthYellow,
      surface: grey,
      error: Colors.redAccent,
      onPrimary: primaryYellow,
      onSecondary: textPrimary,
      onTertiary: ligthYellow,
      onSurface: grey,
      onError: Colors.redAccent,
    );
    return colorScheme;
  }
}
