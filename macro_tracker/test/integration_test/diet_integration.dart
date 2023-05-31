import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:macro_tracker/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Add food from diet', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('Diary'), findsAtLeastNWidgets(1));

    final Finder diet = find.byIcon(Icons.restaurant_menu_sharp);
    await tester.tap(diet);
    await tester.pumpAndSettle();

    expect(find.byType(Scaffold), findsWidgets);
    expect(find.byType(SafeArea), findsNWidgets(2));
    expect(find.byType(SingleChildScrollView), findsAtLeastNWidgets(1));
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(Padding), findsWidgets);
    expect(find.text("Diet"), findsAtLeastNWidgets(1));
    expect(find.byIcon(Icons.add_circle_outline_rounded), findsWidgets);

    final Finder plus = find.byIcon(Icons.add_circle_outline_rounded).first;

    await tester.tap(plus);
    await tester.pumpAndSettle();
    expect(find.text('Diary'), findsWidgets);
  });

  testWidgets('From diet modify food', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('Diary'), findsAtLeastNWidgets(1));

    final Finder diet = find.byIcon(Icons.restaurant_menu_sharp);
    await tester.tap(diet);
    await tester.pumpAndSettle();

    expect(find.byType(Scaffold), findsWidgets);
    expect(find.byType(SafeArea), findsNWidgets(2));
    expect(find.byType(SingleChildScrollView), findsAtLeastNWidgets(1));
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(Padding), findsWidgets);
    expect(find.text("Diet"), findsAtLeastNWidgets(1));
    expect(find.byIcon(Icons.add_circle_outline_rounded), findsWidgets);

    final Finder plus = find.byIcon(Icons.mode_edit).first;

    await tester.tap(plus);
    await tester.pumpAndSettle();
    
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(SingleChildScrollView), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Icon), findsNWidgets(1));
    expect(find.byType(Padding), findsWidgets);
    expect(find.text("Edit food"), findsOneWidget);
  });
}