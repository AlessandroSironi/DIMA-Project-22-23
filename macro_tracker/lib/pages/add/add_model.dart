import '/components/food_item_no_modify_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  var scannedBarcode = '';
  // Model for foodItemNoModify component.
  late FoodItemNoModifyModel foodItemNoModifyModel1;
  // Model for foodItemNoModify component.
  late FoodItemNoModifyModel foodItemNoModifyModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    foodItemNoModifyModel1 =
        createModel(context, () => FoodItemNoModifyModel());
    foodItemNoModifyModel2 =
        createModel(context, () => FoodItemNoModifyModel());
  }

  void dispose() {
    foodItemNoModifyModel1.dispose();
    foodItemNoModifyModel2.dispose();
  }

  /// Additional helper methods are added here.

}