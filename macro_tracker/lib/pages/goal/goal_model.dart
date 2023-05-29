import 'package:macro_tracker/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class GoalModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for kcalValue widget.
  TextEditingController? kcalValueController1;
  String? Function(BuildContext, String?)? kcalValueController1Validator;
  // State field(s) for carbsValue widget.
  TextEditingController? carbsValueController1;
  String? Function(BuildContext, String?)? carbsValueController1Validator;
  // State field(s) for proteinsValue widget.
  TextEditingController? proteinsValueController1;
  String? Function(BuildContext, String?)? proteinsValueController1Validator;
  // State field(s) for fatsValue widget.
  TextEditingController? fatsValueController1;
  String? Function(BuildContext, String?)? fatsValueController1Validator;
  // State field(s) for carousel widget.
  PageController? carouselController1;
  // State field(s) for kcalValue widget.
  TextEditingController? kcalValueController2;
  String? Function(BuildContext, String?)? kcalValueController2Validator;
  // State field(s) for carbsValue widget.
  TextEditingController? carbsValueController2;
  String? Function(BuildContext, String?)? carbsValueController2Validator;
  // State field(s) for proteinsValue widget.
  TextEditingController? proteinsValueController2;
  String? Function(BuildContext, String?)? proteinsValueController2Validator;
  // State field(s) for fatsValue widget.
  TextEditingController? fatsValueController2;
  String? Function(BuildContext, String?)? fatsValueController2Validator;
  // State field(s) for carousel widget.
  PageController? carouselController2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    kcalValueController1?.dispose();
    carbsValueController1?.dispose();
    proteinsValueController1?.dispose();
    fatsValueController1?.dispose();
    kcalValueController2?.dispose();
    carbsValueController2?.dispose();
    proteinsValueController2?.dispose();
    fatsValueController2?.dispose();
  }

  /// Additional helper methods are added here.
}
