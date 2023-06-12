import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_calendar.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_icon_button.dart';
import 'package:mockito/mockito.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../mocks/pages/diary/diary_widget_mock.dart';
import '../test_navigator.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockAppNavigator extends Mock implements AppNavigator {}

void main() {
  final appNavigator = MockAppNavigator();

  setUp(() {
    reset(appNavigator);
  });

  testWidgets("Display Diary", (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(1656, 2688);
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: Builder(builder: (context) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
            child: DiaryWidgetMock(),
          );
        }),
      ),
    ));
    expect(find.byType(SafeArea), findsNWidgets(2));
    expect(find.byType(SingleChildScrollView), findsAtLeastNWidgets(1));
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(ListView), findsWidgets);
    expect(find.byType(FlutterFlowCalendar), findsOneWidget);
    expect(find.byType(CircularPercentIndicator), findsNWidgets(3));
    expect(find.byType(LinearPercentIndicator), findsNWidgets(1));
    expect(find.byType(Divider), findsOneWidget);
    expect(find.byType(FlutterFlowIconButton), findsNWidgets(4));

    expect(find.text("Carbs"), findsOneWidget);
    expect(find.text("Proteins"), findsOneWidget);
    expect(find.text("Fats"), findsOneWidget);
    expect(find.text("Calories"), findsOneWidget);
    expect(find.text("Coffee assumption"), findsOneWidget);
    expect(find.text("Water assumption"), findsOneWidget);
    expect(find.text("Today\'s Adds:"), findsOneWidget);
    expect(find.text("0 / 100 g"), findsNWidgets(4));
    expect(find.text("glasses"), findsOneWidget);
    expect(find.text("cups"), findsOneWidget);
    expect(find.text("0"), findsNWidgets(2));
  });
}
