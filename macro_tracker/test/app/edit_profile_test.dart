import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../mocks/pages/edit_profile/edit_profile_widget-mock.dart';
import '../test_navigator.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockAppNavigator extends Mock implements AppNavigator {}

void main() {
  final appNavigator = MockAppNavigator();

  setUp(() {
    reset(appNavigator);
  });

  testWidgets("Display Edit Profile", (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(1656, 2688);
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: Builder(builder: (context) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
            child: EditProfileWidgetMock(),
          );
        }),
      ),
    ));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Icon), findsNWidgets(4));
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(TextFormField), findsNWidgets(3));

    expect(find.text("Edit Profile"), findsOneWidget);
    expect(find.text("Update Account Information"), findsOneWidget);
    expect(find.text("Save Changes"), findsOneWidget);
  });
}
