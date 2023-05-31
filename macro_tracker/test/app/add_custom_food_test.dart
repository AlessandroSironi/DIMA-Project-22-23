import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_choice_chips.dart';
import 'package:mockito/mockito.dart';

import '../mocks/pages/add_barcode_food/add_barcode_food_widget_mock.dart';
import '../mocks/pages/add_custom_food/add_custom_food_widget_mock.dart';
import '../test_navigator.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockAppNavigator extends Mock implements AppNavigator {}

void main() {
  final appNavigator = MockAppNavigator();

  setUp(() {
    reset(appNavigator);
  });

  testWidgets("Display Add Custom Food", (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(1656, 2688);
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: Builder(builder: (context) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
            child: AddCustomFoodWidgetMock(),
          );
        }),
      ),
    ));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SafeArea), findsNWidgets(2));
    expect(find.byType(SingleChildScrollView), findsAtLeastNWidgets(1));
    expect(find.byType(Text), findsWidgets);

    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Row), findsWidgets);

    expect(find.byType(Padding), findsWidgets);
  });
}