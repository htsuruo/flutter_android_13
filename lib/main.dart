import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_13/components/filled_button.dart';
import 'package:flutter_android_13/components/filled_tonal_button.dart';
import 'package:flutter_android_13/theme/app_colors.dart';
import 'package:flutter_android_13/theme/themes.dart';
import 'package:gap/gap.dart';
import 'package:intersperse/intersperse.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simple_logger/simple_logger.dart';

void main() {
  runApp(const MyApp());
}

final _logger = SimpleLogger();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: ((lightDynamic, darkDynamic) {
        return MaterialApp(
          title: 'Flutter Android 13 Sample',
          theme: Themes.light(dynamic: lightDynamic),
          darkTheme: Themes.dark(dynamic: darkDynamic),
          home: const _NotificationPage(),
          // home: const _DynamicColorPage(),
        );
      }),
    );
  }
}

class _DynamicColorPage extends StatelessWidget {
  const _DynamicColorPage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Color Sample')),
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
        onPressed: () {
          showDialog(
            context: context,
            builder: ((context) => const AlertDialog(
                  title: Text('Title'),
                  content: Text('this is content'),
                )),
          );
        },
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

class _NotificationPage extends StatefulWidget {
  const _NotificationPage();

  @override
  State<_NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<_NotificationPage> {
  PermissionStatus? _status;

  @override
  void initState() {
    super.initState();
    Future(() async {
      final notificationStatus = await Permission.notification.status;
      _logger.info('notificationStatus: $notificationStatus');
      setState(() {
        _status = notificationStatus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final status = _status;
    return Scaffold(
      appBar: AppBar(title: const Text('Notification Permission Sample')),
      body: ListTile(
        title: const Text('Notification Status'),
        trailing: Text(_status?.name ?? 'Loading...'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: status == null
            ? null
            : () async {
                if (status.isDenied) {
                  _status = await Permission.notification.request();
                }
                setState(() {});
              },
        child: const Icon(Icons.add),
      ),
    );
  }
}
