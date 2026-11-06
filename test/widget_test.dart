import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:starter/app.dart';

void main() {
  testWidgets('boots to the home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Starter'), findsWidgets);
    expect(find.byIcon(Icons.rocket_launch_outlined), findsOneWidget);
  });
}
