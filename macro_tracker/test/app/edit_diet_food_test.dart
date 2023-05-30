import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_widgets.dart';
import 'package:mockito/mockito.dart';
import '../mocks/pages/edit_diet_food/edit_diet_food_widget_mock.dart';
import '../mocks/pages/edit_profile/edit_profile_widget-mock.dart';
import '../mocks/pages/register/register_widget_mock.dart';
import '../test_navigator.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockAppNavigator extends Mock implements AppNavigator {}

void main() {
  final appNavigator = MockAppNavigator();

  setUp(() {
    reset(appNavigator);
  });

  testWidgets("Display Edit Diet Food", (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(1656,2688);
    await tester.pumpWidget(MaterialApp(
        home: Material(
        child: Builder(
          builder: (context) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
              child: EditDietFoodWidgetMock(),
            );
          }
        ),
      ),
    )
  );
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(SingleChildScrollView), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Icon), findsNWidgets(1));
    expect(find.byType(Padding), findsWidgets);
  }
  );
}