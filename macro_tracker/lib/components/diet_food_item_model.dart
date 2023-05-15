import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DietFoodItemModel extends FlutterFlowModel {
  String carbs = "";
  String fats = "";
  String proteins = "";
  String kcal = "";
  String name = "";
  String meal = "";
  String quantity = "";
  DateTime datetime = DateTime.now();

  DietFoodItemModel(
      {required carbs,
      required fats,
      required proteins,
      required kcal,
      required name,
      required meal,
      required quantity,
      required datetime}) {
    this.carbs = carbs;
    this.fats = fats;
    this.proteins = proteins;
    this.kcal = kcal;
    this.name = name;
    this.meal = meal;
    this.quantity = quantity;
    this.datetime = datetime;
  }

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.
}
