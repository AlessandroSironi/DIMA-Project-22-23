import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullNameField widget.
  TextEditingController? fullNameFieldController;
  String? Function(BuildContext, String?)? fullNameFieldControllerValidator;
  // State field(s) for mailField widget.
  TextEditingController? mailFieldController;
  String? Function(BuildContext, String?)? mailFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    fullNameFieldController?.dispose();
    mailFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
