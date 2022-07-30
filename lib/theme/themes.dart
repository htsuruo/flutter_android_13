import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

// `material-dynamic-color-flutter`のサンプル
// ref. https://github.com/material-foundation/material-dynamic-color-flutter/blob/main/example/lib/complete_example.dart
class Themes {
  Themes();
  static const _seedColor = Colors.green;

  static light({required ColorScheme? dynamic}) {
    return ThemeData.from(
      colorScheme: _lightScheme(dynamic: dynamic),
      useMaterial3: true,
    );
  }

  static dark({required ColorScheme? dynamic}) {
    return ThemeData.from(
      colorScheme: _darkScheme(dynamic: dynamic),
      useMaterial3: true,
    );
  }

  // 壁紙テーマが未設定もしくはAndroid 12未満の場合は`DynamicColorBuilder`の引数はいずれもnullとなるため、
  // 従来通りサービスのブランドカラーのスキームを利用する。
  static _lightScheme({required ColorScheme? dynamic}) {
    return dynamic == null
        ? ColorScheme.fromSeed(
            seedColor: _seedColor,
          )
        : dynamic.harmonized();
  }

  static _darkScheme({required ColorScheme? dynamic}) {
    return dynamic == null
        ? ColorScheme.fromSeed(
            seedColor: _seedColor,
            brightness: Brightness.dark,
          )
        : dynamic.harmonized();
  }
}
