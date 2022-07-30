import 'package:flutter/material.dart';

// ref. PR: https://github.com/flutter/flutter/pull/100794/files#diff-aac3a34e6f8e5c540516600483774c89534da079af53feb8ea1ac7dd76c1558b
// ref. Issue: https://github.com/flutter/flutter/issues/99022
class FilledButton extends StatelessWidget {
  const FilledButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        onPrimary: Theme.of(context).colorScheme.onPrimary,
        primary: Theme.of(context).colorScheme.primary,
      ).copyWith(
        elevation: ButtonStyleButton.allOrNull(0.0),
      ),
      child: const Text('Elevated'),
    );
  }
}
