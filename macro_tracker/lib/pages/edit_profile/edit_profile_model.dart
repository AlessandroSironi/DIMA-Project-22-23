
import 'package:flutter/material.dart';

import 'package:macro_tracker/flutter_flow/flutter_flow_util.dart';

class EditProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullNameField widget.
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  TextEditingController? surnameFieldController;
  String? Function(BuildContext, String?)? surnameFieldControllerValidator;
  // State field(s) for mailField widget.
  TextEditingController? mailFieldController;
  String? Function(BuildContext, String?)? mailFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nameFieldController?.dispose();
    surnameFieldController?.dispose();
    mailFieldController?.dispose();
  }

  /// Additional helper methods are added here.
}
