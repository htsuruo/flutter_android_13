import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_13/components/filled_button.dart';
import 'package:flutter_android_13/components/filled_tonal_button.dart';
import 'package:flutter_android_13/theme/app_colors.dart';
import 'package:flutter_android_13/theme/themes.dart';
import 'package:gap/gap.dart';
import 'package:intersperse/intersperse.dart';

void main() {
  runApp(const MyApp());
}

const _titleLabel = 'Dynamic Theme Sample';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: ((lightDynamic, darkDynamic) {
        return MaterialApp(
          title: _titleLabel,
          theme: Themes.light(dynamic: lightDynamic),
          darkTheme: Themes.dark(dynamic: darkDynamic),
          home: const HomePage(),
        );
      }),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text(_titleLabel)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ColorCircle(
                  schemeName: 'Primary',
                  color: colorScheme.primary,
                ),
                _ColorCircle(
                  schemeName: 'Secondary',
                  color: colorScheme.secondary,
                ),
                _ColorCircle(
                  schemeName: 'Tertiary',
                  color: colorScheme.tertiary,
                ),
                _ColorCircle(
                  schemeName: 'Error',
                  color: colorScheme.error,
                ),
              ],
            ),
            _ColorCircle(
              schemeName: 'Custom',
              color: theme.extension<AppColors>()!.accent,
            ),
            const Divider(),
            const FilledButton(),
            const FilledTonalButton(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Text'),
            ),
          ].intersperse(const Gap(16)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ColorCircle extends StatelessWidget {
  const _ColorCircle({
    required this.schemeName,
    required this.color,
  });

  final String schemeName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const size = 60.0;
    return Column(
      children: [
        Text(
          schemeName,
          style:
              theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        const Gap(8),
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
