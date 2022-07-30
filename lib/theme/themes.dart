import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_13/theme/app_colors.dart';

// `material-dynamic-color-flutter`のサンプル
// ref. https://github.com/material-foundation/material-dynamic-color-flutter/blob/main/example/lib/complete_example.dart
class Themes {
  Themes();
  static const _seedColor = Colors.green;

  static light({required ColorScheme? dynamic}) {
    return ThemeData.from(
      colorScheme: _lightScheme(dynamic),
      useMaterial3: true,
    ).copyWith(
      extensions: [
        AppColors.light(dynamic),
      ],
    );
  }

  // 壁紙テーマが未設定もしくはAndroid 12未満の場合は`DynamicColorBuilder`の引数はいずれもnullとなるため、
  // 従来通りサービスのブランドカラーのスキームを利用する。
  static _lightScheme(ColorScheme? dynamic) {
    return dynamic == null
        ? ColorScheme.fromSeed(
            seedColor: _seedColor,
          )
        : dynamic.harmonized();
  }

  static dark({required ColorScheme? dynamic}) {
    return ThemeData.from(
      colorScheme: _darkScheme(dynamic),
      useMaterial3: true,
    ).copyWith(
      extensions: [
        AppColors.dark(dynamic),
      ],
    );
  }

  static _darkScheme(ColorScheme? dynamic) {
    return dynamic == null
        ? ColorScheme.fromSeed(
            seedColor: _seedColor,
            brightness: Brightness.dark,
          )
        : dynamic.harmonized();
  }
}
