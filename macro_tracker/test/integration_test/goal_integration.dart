import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_icon_button.dart';

import 'package:macro_tracker/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Navigate to goal', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Diary'), findsAtLeastNWidgets(1));

    final Finder goal = find.byIcon(Icons.emoji_events_outlined);
    await tester.tap(goal);
    await tester.pumpAndSettle();

    expect(find.text("Goal"), findsWidgets);

    expect(find.byType(Scaffold), findsWidgets);
    expect(find.byType(Text), findsAtLeastNWidgets(5));
    expect(find.byType(Padding), findsAtLeastNWidgets(5));
    expect(find.byType(SafeArea), findsNWidgets(2));
    expect(find.byType(Expanded), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(TextFormField), findsAtLeastNWidgets(4));
    expect(find.byType(SingleChildScrollView), findsWidgets);
    expect(find.byType(PageView), findsWidgets);
    expect(find.byType(FlutterFlowIconButton), findsAtLeastNWidgets(8));
  });

  testWidgets('Navigate to goal and add/remove calories', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Diary'), findsAtLeastNWidgets(1));

    final Finder goal = find.byIcon(Icons.emoji_events_outlined);
    await tester.tap(goal);
    await tester.pumpAndSettle();

    expect(find.text('Goal'), findsWidgets);

    expect(find.byType(TextFormField), findsWidgets);
    final Finder kcalGoal = find.byType(TextFormField).first;
    await tester.enterText(kcalGoal, '2000');
    await tester.pumpAndSettle();
    expect(find.text("2000"), findsOneWidget);

    final Finder plusButton = find.byIcon(Icons.add_circle_sharp).first;
    await tester.tap(plusButton);
    await tester.pumpAndSettle();

    expect(find.text("2050"), findsOneWidget);

    final Finder minusButton = find.byIcon(Icons.remove_circle).first;
    await tester.tap(minusButton);
    await tester.pumpAndSettle();

    expect(find.text("2000"), findsOneWidget);
  });
}
