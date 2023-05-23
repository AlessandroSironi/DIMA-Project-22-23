import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

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
