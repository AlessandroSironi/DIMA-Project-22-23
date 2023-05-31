import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:macro_tracker/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Navigate to profile', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Diary'), findsAtLeastNWidgets(1));

    final Finder profile = find.byIcon(Icons.person_sharp);
    await tester.tap(profile);
    await tester.pumpAndSettle();

    expect(find.text("Welcome"), findsWidgets);

    expect(find.byType(Scaffold), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Expanded), findsWidgets);
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(InkWell), findsWidgets);
    expect(find.byType(Padding), findsWidgets);
  });

  testWidgets('Navigate to Profile and navigate to Edit Profile',
      (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Diary'), findsAtLeastNWidgets(1));

    final Finder profile = find.byIcon(Icons.person_sharp);
    await tester.tap(profile);
    await tester.pumpAndSettle();

    expect(find.text("Welcome"), findsWidgets);
    expect(find.text("Switch to Dark Mode"), findsOneWidget);

    final Finder inkwell = find.byType(InkWell).at(2);
    await tester.tap(inkwell);
    await tester.pumpAndSettle();

    expect(find.text("Switch to Light Mode"), findsOneWidget);

    await tester.tap(inkwell);
    await tester.pumpAndSettle();

    expect(find.text("Switch to Dark Mode"), findsOneWidget);
  });
}
