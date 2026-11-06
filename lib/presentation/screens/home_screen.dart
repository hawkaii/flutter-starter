import 'package:flutter/material.dart';

/// The first screen you see. Replace it with the app's real home.
///
/// It is deliberately a real screen rather than "Hello World" in a `Center`:
/// it exercises the theme, shows what a screen in this repo looks like, and
/// gives the widget test something stable to assert on.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Starter')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.rocket_launch_outlined,
                size: 64,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text('Starter', style: theme.textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(
                'Replace this screen with something worth shipping.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
