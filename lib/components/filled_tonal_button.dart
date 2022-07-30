import 'package:flutter/material.dart';

class FilledTonalButton extends StatelessWidget {
  const FilledTonalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // Foreground color
        onPrimary: Theme.of(context).colorScheme.onSecondaryContainer,
        // Background color
        primary: Theme.of(context).colorScheme.secondaryContainer,
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      onPressed: () {},
      child: const Text('Filled Tonal'),
    );
  }
}
