import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:macro_tracker/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Navigate to add', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify I am in Diary.
    expect(find.text('Diary'), findsAtLeastNWidgets(1));

    // Finds the floating action button to tap on.
    final Finder add = find.byIcon(Icons.add_circle);

    // Emulate a tap on the floating action button.
    await tester.tap(add);

    // Trigger a frame.
    await tester.pumpAndSettle();

    expect(find.text('Add'), findsOneWidget);
  });

  testWidgets('Navigate to add and Add Manual Macros', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Diary'), findsAtLeastNWidgets(1));
    final Finder add = find.byIcon(Icons.playlist_add_sharp);
    await tester.tap(add);
    await tester.pumpAndSettle();

    expect(find.text('Add food'), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SafeArea), findsNWidgets(2));
    expect(find.byType(SingleChildScrollView), findsAtLeastNWidgets(1));
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(TextFormField), findsAtLeastNWidgets(6));
  });
}