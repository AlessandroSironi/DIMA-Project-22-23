import 'package:macro_tracker/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class FoodItemModel extends FlutterFlowModel {
  String carbs = "";
  String fats = "";
  String proteins = "";
  String kcal = "";
  String name = "";
  String meal = "";
  String quantity = "";
  DateTime datetime = DateTime.now();
  int id = 0;

  FoodItemModel(
      {required carbs,
      required fats,
      required proteins,
      required kcal,
      required name,
      required meal,
      required quantity,
      required datetime,
      required id}) {
    this.carbs = carbs;
    this.fats = fats;
    this.proteins = proteins;
    this.kcal = kcal;
    this.name = name;
    this.meal = meal;
    this.quantity = quantity;
    this.datetime = datetime;
    this.id = id;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.
}
