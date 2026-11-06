import 'package:flutter/material.dart';

import 'app.dart';

/// The only entry point. Everything it starts lives in `app.dart`, so a test
/// can pump the app without touching the platform channels `main` owns.
void main() {
  runApp(const App());
}
