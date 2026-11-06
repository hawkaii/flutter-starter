import 'package:flutter/material.dart';

/// One seed colour, two themes. Every other colour is derived from the seed by
/// [ColorScheme.fromSeed], so restyling the app is one line here rather than a
/// search for hardcoded `Color(0xFF…)` across the tree.
abstract final class AppTheme {
  /// Change this and the whole app follows.
  static const Color seed = Color(0xFF6B4EFF);

  static ThemeData get light => _build(Brightness.light);

  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: brightness,
    );

    return ThemeData(
      colorScheme: scheme,
      // Density follows the platform: roomier on iOS, tighter on Android.
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
