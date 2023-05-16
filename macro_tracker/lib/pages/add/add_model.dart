import '/components/food_item_no_modify_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:openfoodfacts/openfoodfacts.dart';

class AddModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  var scannedBarcode = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {

    OpenFoodAPIConfiguration.userAgent = UserAgent(name: 'Macro Tracker', url: 'https://www.polimi.it');
    OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[
      OpenFoodFactsLanguage.ENGLISH
    ]; 

    OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.ITALY;
  }

  void dispose() {}

  /// Additional helper methods are added here.
}
