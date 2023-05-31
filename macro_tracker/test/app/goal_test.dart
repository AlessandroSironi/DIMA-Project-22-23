import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_icon_button.dart';
import 'package:mockito/mockito.dart';

import '../mocks/pages/goal/goal_widget_mock.dart';
import '../test_navigator.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockAppNavigator extends Mock implements AppNavigator {}

void main() {
  final appNavigator = MockAppNavigator();

  setUp(() {
    reset(appNavigator);
  });

  testWidgets("Display Goals", (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(1656, 2688);
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: Builder(builder: (context) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
            child: GoalWidgetMock(),
          );
        }),
      ),
    ));
    expect(find.byType(Scaffold), findsOneWidget);
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

    expect(find.text("Goal"), findsOneWidget);
    expect(find.text("Kcal goal:"), findsOneWidget);
    expect(find.text("Carbs goal:"), findsOneWidget);
    expect(find.text("Proteins goal:"), findsOneWidget);
    expect(find.text("Fats goal:"), findsOneWidget);
    expect(find.text("🔥 KCAL"), findsOneWidget);
    expect(find.text("🍞 Carbs"), findsOneWidget);
    expect(find.text("🥩 Proteins"), findsOneWidget);
    expect(find.text("🥑 Fats"), findsOneWidget);
    expect(find.text("A few tips:"), findsOneWidget);
  });
}
