import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'presentation/screens/home_screen.dart';

/// The root widget: theme, title and the first screen.
///
/// Routing, state and localisation all attach here, at the one place every
/// screen is reached from — so they stay out of `main`, which stays a one-liner.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starter',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
