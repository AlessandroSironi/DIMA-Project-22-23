import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
    final mockObserver = MockNavigatorObserver();
    tester.binding.window.physicalSizeTestValue = Size(1656,2688);
    await tester.pumpWidget(MaterialApp(
        home: Material(
        child: Builder(
          builder: (context) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
              child: GoalWidgetMock(),
            );
          }
        ),
      ),
    )
  );
    expect(find.byType(Column), findsWidgets);
  }
  );
}