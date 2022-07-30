import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.accent,
  });

  // Dynamic Colorが有効な場合は`harmonizeWith`でプライマリカラーと調和する。
  // これにより、Dynamic Colorの色相に近い色合いとなりアプリ全体でまとまりが出る。
  factory AppColors.light(ColorScheme? dynamic) {
    const appColors = AppColors(
      accent: Color(0xFFEF61E1),
    );
    return dynamic == null ? appColors : appColors._harmonized(dynamic);
  }

  factory AppColors.dark(ColorScheme? dynamic) {
    const appColors = AppColors(
      accent: Color(0xFFF4C1EF),
    );
    return dynamic == null ? appColors : appColors._harmonized(dynamic);
  }

  final Color accent;

  // 内部的には`material_color_utilities`パッケージの`Blend`クラスの`harmonize()`メソッドを使って調和している
  AppColors _harmonized(ColorScheme dynamic) {
    return copyWith(
      custom: accent.harmonizeWith(dynamic.primary),
    );
  }

  @override
  AppColors copyWith({
    Color? custom,
  }) {
    return AppColors(
      accent: custom ?? accent,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      accent: Color.lerp(accent, other.accent, t)!,
    );
  }

  @override
  String toString() => 'AppColors(custom: $accent)';
}
