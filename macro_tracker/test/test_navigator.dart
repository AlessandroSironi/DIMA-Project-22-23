import 'package:flutter/material.dart';

class AppNavigatorFactory {
  AppNavigator get(BuildContext context) =>
      AppNavigator._forNavigator(Navigator.of(context));
}

class TestAppNavigatorFactory extends AppNavigatorFactory {
  final AppNavigator mockAppNavigator;

  TestAppNavigatorFactory(this.mockAppNavigator);

  @override
  AppNavigator get(BuildContext context) => mockAppNavigator;
}

class AppNavigator {
  NavigatorState _flutterNavigator;
  AppNavigator._forNavigator(this._flutterNavigator);

  void showNextscreen() {
    _flutterNavigator.pushNamed('/nextscreen');
  }
}
