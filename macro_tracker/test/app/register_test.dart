import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../mocks/pages/register/register_widget_mock.dart';
import '../test_navigator.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockAppNavigator extends Mock implements AppNavigator {}

void main() {
  final appNavigator = MockAppNavigator();

  setUp(() {
    reset(appNavigator);
  });

  testWidgets("Display Register", (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(1656, 2688);
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: Builder(builder: (context) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
            child: RegisterWidgetMock(),
          );
        }),
      ),
    ));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Expanded), findsWidgets);
    expect(find.byType(Icon), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(TextFormField), findsNWidgets(4));
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(InkWell), findsWidgets);

    expect(find.text("MacroTracker"), findsOneWidget);
    expect(find.text("Create Account"), findsOneWidget);
    expect(find.text("Already have an account?"), findsOneWidget);
    expect(find.text("Login"), findsOneWidget);
  });
}
